//
//  CountryUseCase.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 25.11.25.
//

import Foundation

protocol CountryUseCase {
    func getAllCountries(completion: @escaping (([Country]?, String?) -> Void))
    func getCountryByName(name: String, completion: @escaping (([Country]?, String?) -> Void))
    func getUnsplashPhoto(query: String, completion: @escaping ((UnsplashSearchResponse?, String?) -> Void))
    func getWeather(city: String, completion: @escaping ((WeatherResponse?, String?) -> Void))
    func getWikipediaSummary(title: String, completion: @escaping ((WikipediaSummary?, String?) -> Void))
}
