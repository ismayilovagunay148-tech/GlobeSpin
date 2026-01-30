//
//  FavoritesViewModel.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 27.12.25.
//

import Foundation

final class FavoritesViewModel {
    
    enum ViewState {
        case loading
        case success([Country])
        case empty
        case error(String)
    }
    
    private let coordinator: FavoritesCoordinator
    private let favoritesManager = FavoritesManager.shared
    private let authService = AuthService.shared
    
    var viewState: ((ViewState) -> Void)?
    
    init(coordinator: FavoritesCoordinator) {
        self.coordinator = coordinator
    }
    
    func loadFavorites() {
        guard let userId = authService.getCurrentUserId() else {
            viewState?(.error("User not logged in"))
            return
        }
        
        viewState?(.loading)
        
        favoritesManager.getFavorites(userId: userId) { [weak self] countries, error in
            DispatchQueue.main.async {
                if let error = error {
                    self?.viewState?(.error(error.localizedDescription))
                    return
                }
                
                if let countries = countries, !countries.isEmpty {
                    self?.viewState?(.success(countries))
                } else {
                    self?.viewState?(.empty)
                }
            }
        }
    }
    
    func selectCountry(_ country: Country) {
        coordinator.showCountryDetail(country: country)
    }
}
