//
//  CountryDetailViewModel.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 20.12.25.
//

import Foundation

final class CountryDetailViewModel {
    
    private let coordinator: CountryDetailCoordinator
    private let country: Country
    
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    init(coordinator: CountryDetailCoordinator, country: Country) {
        self.coordinator = coordinator
        self.country = country
    }
    
    func getCountry() -> Country {
        return country
    }
    
    func getCountryName() -> String {
        return country.name
    }
    
    func getCapital() -> String {
        return country.capital
    }
    
    func getImageURL() -> String {
        return country.imageURL
    }
    
    func getTemperature() -> String {
        return country.weather.displayTemperature
    }
    
    func getWeatherCondition() -> String {
        return country.weather.description
    }
    
    func getFunFact() -> String {
        return country.funFact
    }
}
