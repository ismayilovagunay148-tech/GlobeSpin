//
//  NetworkingHelper.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 11.11.25.
//

//import Foundation
//import Alamofire
//
//enum Endpoint: String {
//    case allCountries = "all"
//    case search = "search"
//}
//
//final class NetworkingHelper {
//    
//    private let restCountriesURL = "https://restcountries.com/v3.1/"
//    private let unsplashURL = "https://api.unsplash.com/"
//    private let weatherURL = "https://api.openweathermap.org/data/2.5/"
//    private let wikipediaURL = "https://en.wikipedia.org/api/rest_v1/page/"
//    
//    let unsplashHeaders: HTTPHeaders = ["Authorization": "Client-ID \(APIKeys.unsplashKey)"]
//    
//    static let shared = NetworkingHelper()
//    
//    private init() {}
//    
//    
//    func configureURL(endpoint: String) -> String {
//        restCountriesURL + endpoint
//    }
//    
//    func configureUnsplashURL(endpoint: String) -> String {
//        unsplashURL + endpoint
//    }
//    
//    func configureWeatherURL(endpoint: String) -> String {
//        weatherURL + endpoint
//    }
//    
//    func configureWikipediaURL(endpoint: String) -> String {
//        wikipediaURL + endpoint
//    }
//}
