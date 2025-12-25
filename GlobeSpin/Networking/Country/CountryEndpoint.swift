//
//  CountryEndpoint.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 25.11.25.
//


import Foundation

enum CountryEndpoint: String {
    case allCountries = "countries"
    case countryByName = "country"
    
    var path: String {
        switch self {
        case .allCountries:
            return NetworkingHelper.shared.configureURL(endpoint: self.rawValue)
        case .countryByName:
            return NetworkingHelper.shared.configureURL(endpoint: self.rawValue)
        }
    }
    
    func pathWithName(_ name: String) -> String {
        return NetworkingHelper.shared.configureURL(endpoint: "\(self.rawValue)/\(name.lowercased())")
    }
}
