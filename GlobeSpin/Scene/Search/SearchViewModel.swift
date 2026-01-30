//
//  SearchViewModel.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 23.12.25.
//

import Foundation

final class SearchViewModel {
    
    enum ViewState {
        case loading
        case success([Country])
        case loadingMore
        case error(String)
    }
    
    private let coordinator: SearchCoordinator
    private let searchManager = SearchManager.shared
    private let networkMonitor = NetworkMonitor.shared
    
    var viewState: ((ViewState) -> Void)?
    
    private var currentPage = 0
    private let itemsPerPage = 20
    private var isLoadingMore = false
    private var hasMorePages = true
    private var currentSearchQuery = ""
    
    private var displayedCountries: [Country] = []
    
    init(coordinator: SearchCoordinator) {
        self.coordinator = coordinator
    }
    
    func loadCountries() {
        guard networkMonitor.isConnected else {
            viewState?(.error("No internet connection. Please check your connection and try again."))
            return
        }
        
        viewState?(.loading)
        
        searchManager.loadAllCountries { [weak self] countries, error in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                if let error = error {
                    self.viewState?(.error(error))
                    return
                }
                
                self.currentPage = 0
                self.loadPage(isInitialLoad: true)
            }
        }
    }
    
    private func loadPage(isInitialLoad: Bool = false) {
        let newCountries: [Country]
        
        if currentSearchQuery.isEmpty {
            newCountries = searchManager.getCountries(page: currentPage, itemsPerPage: itemsPerPage)
        } else {
            let allSearchResults = searchManager.searchCountries(query: currentSearchQuery)
            let startIndex = currentPage * itemsPerPage
            let endIndex = min(startIndex + itemsPerPage, allSearchResults.count)
            
            if startIndex < allSearchResults.count {
                newCountries = Array(allSearchResults[startIndex..<endIndex])
            } else {
                newCountries = []
            }
        }
        
        if isInitialLoad {
            displayedCountries = newCountries
        } else {
            displayedCountries.append(contentsOf: newCountries)
        }
        
        hasMorePages = !newCountries.isEmpty && newCountries.count == itemsPerPage
        viewState?(.success(displayedCountries))
        isLoadingMore = false
    }
    
    func loadMoreCountries() {
        guard !isLoadingMore && hasMorePages else { return }
        
        isLoadingMore = true
        viewState?(.loadingMore)
        currentPage += 1
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
            self?.loadPage(isInitialLoad: false)
        }
    }
    
    func search(query: String) {
        currentSearchQuery = query
        currentPage = 0
        hasMorePages = true
        
        if query.isEmpty {
            loadPage(isInitialLoad: true)
        } else {
            let allResults = searchManager.searchCountries(query: query)
            let startIndex = 0
            let endIndex = min(itemsPerPage, allResults.count)
            
            displayedCountries = Array(allResults[startIndex..<endIndex])
            hasMorePages = allResults.count > itemsPerPage
            viewState?(.success(displayedCountries))
        }
    }
    
    func selectCountry(_ country: Country) {
        coordinator.showCountryDetail(country: country)
    }
    
    func canLoadMore() -> Bool {
        return hasMorePages && !isLoadingMore
    }
}
