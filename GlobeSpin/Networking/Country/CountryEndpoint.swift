//
//  CountryEndpoint.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 25.11.25.
//


//import Foundation
//
//struct APIKeys {
//    // Get your free key from: https://unsplash.com/developers
//    static let unsplashKey = "YOUR_UNSPLASH_KEY"
//    
//    // Get your free key from: https://openweathermap.org/api
//    static let openWeatherKey = "YOUR_OPENWEATHER_KEY"
//}
//
//enum CountryEndpoint {
//    case allCountries
//    case countryByName(name: String)
//    case countryByCode(code: String)
//    
//    var path: String {
//        let helper = NetworkingHelper.shared
//        
//        switch self {
//        case .allCountries:
//            return helper.configureURL(endpoint: "all")
//            
//        case .countryByName(let name):
//            let encoded = name.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? name
//            return helper.configureURL(endpoint: "name/\(encoded)")
//            
//        case .countryByCode(let code):
//            return helper.configureURL(endpoint: "alpha/\(code)")
//        }
//    }
//}
//
//enum UnsplashEndpoint {
//    case searchPhotos(query: String, perPage: Int)
//    
//    var path: String {
//        return NetworkingHelper.shared.configureUnsplashURL(endpoint: "search/photos")
//    }
//    
//    var parameters: [String: Any] {
//        switch self {
//        case .searchPhotos(let query, let perPage):
//            return [
//                "query": query,
//                "per_page": perPage,
//                "orientation": "landscape"
//            ]
//        }
//    }
//}
//
//enum WeatherEndpoint {
//    case current(city: String)
//    
//    var path: String {
//        return NetworkingHelper.shared.configureWeatherURL(endpoint: "weather")
//    }
//    
//    func parameters(apiKey: String) -> [String: Any] {
//        switch self {
//        case .current(let city):
//            return [
//                "q": city,
//                "appid": apiKey
//            ]
//        }
//    }
//}
//
//enum WikipediaEndpoint {
//    case summary(title: String)
//    
//    var path: String {
//        switch self {
//        case .summary(let title):
//            let encoded = title.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? title
//            return NetworkingHelper.shared.configureWikipediaURL(endpoint: "summary/\(encoded)")
//        }
//    }
//}
