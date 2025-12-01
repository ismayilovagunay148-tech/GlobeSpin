//
//  RouletteViewModel.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 30.11.25.
//


//
//  PlaceholderViewModels.swift
//  TravelRoulette
//
//  Created on 14.11.25.
//

import Foundation

//
//  RouletteViewModel.swift
//  GlobeSpin
//
//  Created on 14.11.25.
//

import Foundation

final class RouletteViewModel {
    
    var isLoading = false
    
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    var loadingStateChanged: ((Bool) -> Void)?
    
    // MARK: - Spin the Globe
    func spinTheGlobe() {
        guard !isLoading else { return }
        
        isLoading = true
        loadingStateChanged?(true)
        
        // Simulate spinning for 2 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            guard let self = self else { return }
            
            self.isLoading = false
            self.loadingStateChanged?(false)
            
            // Show success
            self.success?()
        }
    }
}


// MARK: - Explore ViewModel (Placeholder)
final class ExploreViewModel {
   // weak var coordinator: SearchCoordinator?
    
    var success: (() -> Void)?
    var error: ((String) -> Void)?
}

// MARK: - Favorites ViewModel (Placeholder)
final class FavoritesViewModel {
    //weak var coordinator: FavoritesCoordinator?
    
    var success: (() -> Void)?
    var error: ((String) -> Void)?
}

// MARK: - Country Detail ViewModel (Placeholder)
final class CountryDetailViewModel {
    let country: Country
    let photo: UnsplashPhoto?
    let weather: WeatherResponse?
    let wiki: WikipediaSummary?
   // weak var coordinator: HomeCoordinator?
    
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    init(country: Country, photo: UnsplashPhoto?, weather: WeatherResponse?, wiki: WikipediaSummary?) {
        self.country = country
        self.photo = photo
        self.weather = weather
        self.wiki = wiki
    }
}

// MARK: - Search ViewModel (Placeholder)
final class SearchViewModel {
   // weak var coordinator: SearchCoordinator?
    
    var success: (() -> Void)?
    var error: ((String) -> Void)?
}
