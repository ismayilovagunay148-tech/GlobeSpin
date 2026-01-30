//
//  SearchManager.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 23.12.25.
//

import Foundation

class SearchManager {
    
    static let shared = SearchManager()
    
    private let countryManager = CountryManager.shared
    private var allCountries: [Country] = []
    
    private init() {}
    
    func loadAllCountries(completion: @escaping ([Country]?, String?) -> Void) {
        countryManager.getAllCountries { [weak self] countries, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            self?.allCountries = countries ?? []
            completion(countries, nil)
        }
    }
    
    func searchCountries(query: String) -> [Country] {
        if query.isEmpty {
            return allCountries
        }
        
        return allCountries.filter { country in
            country.name.lowercased().contains(query.lowercased()) ||
            country.capital.lowercased().contains(query.lowercased())
        }
    }
    
    func getAllAvailableCountries() -> [Country] {
        let excludedCountries = ["Mexico", "Peru"]
        return allCountries.filter { !excludedCountries.contains($0.name) }
    }
    
    func getCountries(page: Int, itemsPerPage: Int = 20) -> [Country] {
        let excludedCountries = ["Mexico", "Peru"]
        let filtered = allCountries.filter { !excludedCountries.contains($0.name) }
        
        let startIndex = page * itemsPerPage
        let endIndex = min(startIndex + itemsPerPage, filtered.count)
        
        guard startIndex < filtered.count else {
            return []
        }
        
        return Array(filtered[startIndex..<endIndex])
    }
    
    func getTotalCountriesCount() -> Int {
        let excludedCountries = ["Mexico", "Peru"]
        return allCountries.filter { !excludedCountries.contains($0.name) }.count
    }
}
