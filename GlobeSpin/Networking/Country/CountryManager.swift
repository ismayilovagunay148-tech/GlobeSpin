//
//  CountryManager.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 20.11.25.
//

import Foundation

class CountryManager: CountryUseCase {
    private let manager = NetworkManager()
    
    static let shared = CountryManager()
    
    private init() {}
    
    func getAllCountries(completion: @escaping (([Country]?, String?) -> Void)) {
        manager.request(url: CountryEndpoint.allCountries.path,
                        model: CountriesResponse.self) { response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            completion(response?.countries, nil)
        }
    }
    
    func getCountry(byName name: String, completion: @escaping ((Country?, String?) -> Void)) {
        manager.request(url: CountryEndpoint.countryByName(name: name).path,
                        model: Country.self,
                        completion: completion)
    }
    
    func getRandomCountry(completion: @escaping ((Country?, String?) -> Void)) {
        getAllCountries { countries, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let countries = countries, !countries.isEmpty else {
                completion(nil, "No countries available")
                return
            }
            
            completion(countries.randomElement(), nil)
        }
    }
}
