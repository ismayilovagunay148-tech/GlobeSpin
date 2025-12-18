//
//  CountryManager.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 25.11.25.
//

//import Foundation
//import Alamofire
//
//class CountryManager: CountryUseCase {
//    private let manager = NetworkManager()
//    
//    func getAllCountries(completion: @escaping (([Country]?, String?) -> Void)) {
//        manager.request(url: CountryEndpoint.allCountries.path,
//                       model: [Country].self,
//                       completion: completion)
//    }
//    
//    func getCountryByName(name: String, completion: @escaping (([Country]?, String?) -> Void)) {
//        manager.request(url: CountryEndpoint.countryByName(name: name).path,
//                       model: [Country].self,
//                       completion: completion)
//    }
//    
//    func getUnsplashPhoto(query: String, completion: @escaping ((UnsplashSearchResponse?, String?) -> Void)) {
//        manager.requestWithCustomHeaders(url: CountryEndpoint.unsplashPhoto(query: query).path,
//                                        model: UnsplashSearchResponse.self,
//                                        headers: NetworkingHelper.shared.unsplashHeaders,
//                                        completion: completion)
//    }
//    
//    func getWeather(city: String, completion: @escaping ((WeatherResponse?, String?) -> Void)) {
//        manager.request(url: CountryEndpoint.weather(city: city).path,
//                       model: WeatherResponse.self,
//                       completion: completion)
//    }
//    
//    func getWikipediaSummary(title: String, completion: @escaping ((WikipediaSummary?, String?) -> Void)) {
//        manager.request(url: CountryEndpoint.wikipediaSummary(title: title).path,
//                       model: WikipediaSummary.self,
//                       completion: completion)
//    }
//}
