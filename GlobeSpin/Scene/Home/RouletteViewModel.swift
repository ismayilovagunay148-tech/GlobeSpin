//
//  RouletteViewModel.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 30.11.25.
//

import Foundation

final class RouletteViewModel {
    
    weak var coordinator: RouletteCoordinator?
    
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    private let countryManager = CountryManager.shared
    private let networkMonitor = NetworkMonitor.shared
    
    init(coordinator: RouletteCoordinator) {
        self.coordinator = coordinator
    }
    
    func spinRoulette() {
        guard networkMonitor.isConnected else {
            error?("No internet connection. Please check your connection and try again.")
            return
        }
        
        countryManager.getRandomCountry { [weak self] country, errorMessage in
            DispatchQueue.main.async {
                if let errorMessage = errorMessage {
                    self?.error?(errorMessage)
                    return
                }
                
                guard let country = country else {
                    self?.error?("Unable to select a destination")
                    return
                }
                
                print("Successfully fetched country: \(country.name)")
                self?.success?()
                self?.coordinator?.showCountryDetail(country: country)
            }
        }
    }
}
