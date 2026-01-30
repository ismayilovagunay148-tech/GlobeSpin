//
//  Country.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 12.11.25.
//

import Foundation

struct CountriesResponse: Codable {
    let count: Int
    let countries: [Country]
}

struct Country: Codable {
    let name: String
    let imageURL: String
    let weather: Weather
    let funFact: String
    let capital: String
    let locationIcon: String
    
    enum CodingKeys: String, CodingKey {
        case name = "country"
        case imageURL = "image"
        case weather
        case funFact
        case capital
        case locationIcon
    }
}

struct Weather: Codable {
    let temperatureC: Int
    let temperatureF: Double
    let description: String
    
    var displayTemperature: String {
        return "\(temperatureC)°C / \(String(format: "%.0f", temperatureF))°F"
    }
}
