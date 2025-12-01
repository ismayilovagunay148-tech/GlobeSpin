//
//  RouletteViewModel.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 30.11.25.
//

import Foundation

final class RouletteViewModel {
    
    weak var coordinator: RouletteCoordinator?
    
    var success: ((String) -> Void)?
    var error: ((String) -> Void)?
    
    private let countries = [
        "Japan", "Italy", "France", "Spain", "Thailand",
        "Greece", "Morocco", "Iceland", "Peru", "Australia",
        "Brazil", "Egypt", "Norway", "New Zealand", "Portugal"
    ]
    
    init(coordinator: RouletteCoordinator) {
        self.coordinator = coordinator
    }
    
    func spinRoulette() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            guard let self = self else { return }
            
            if let randomCountry = self.countries.randomElement() {
                self.success?(randomCountry)
            } else {
                self.error?("Unable to select a destination")
            }
        }
    }
}
