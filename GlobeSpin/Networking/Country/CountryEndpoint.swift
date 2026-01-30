//
//  CountryEndpoint.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 20.11.25.
//

import Foundation

enum CountryEndpoint {
    case allCountries
    case countryByName(name: String)
    
    var path: String {
        switch self {
        case .allCountries:
            return NetworkingHelper.shared.configureURL(endpoint: "countries")
        case .countryByName(let name):
            return NetworkingHelper.shared.configureURL(endpoint: "country/\(name.lowercased())")
        }
    }
}
