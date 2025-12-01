//
//  Country.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 12.11.25.
//

import Foundation

struct Country: Codable {
    let name: CountryName
    let capital: [String]?
    let region: String?
    let subregion: String?
    let population: Int?
    let area: Double?
    let flags: Flags?
    let currencies: [String: Currency]?
    let languages: [String: String]?
    let timezones: [String]?
    let cca2: String?
    let cca3: String?
    let cioc: String?
    let independent: Bool?
    let status: String?
    let unMember: Bool?
    let idd: IDD?
    let altSpellings: [String]?
    let tld: [String]?
    let latlng: [Double]?
    let landlocked: Bool?
    let borders: [String]?
    let demonyms: [String: Demonym]?
    let car: Car?
    let continents: [String]?
    let coatOfArms: CoatOfArms?
    let startOfWeek: String?
    let capitalInfo: CapitalInfo?
    let postalCode: PostalCode?
    
    enum CodingKeys: String, CodingKey {
        case name, capital, region, subregion, population, area, flags
        case currencies, languages, timezones, cca2, cca3, cioc
        case independent, status
        case unMember = "unMember"
        case idd, altSpellings, tld, latlng, landlocked, borders
        case demonyms, car, continents
        case coatOfArms = "coatOfArms"
        case startOfWeek = "startOfWeek"
        case capitalInfo = "capitalInfo"
        case postalCode = "postalCode"
    }
    
    struct CountryName: Codable {
        let common: String
        let official: String
        let nativeName: [String: NativeName]?
        
        struct NativeName: Codable {
            let official: String
            let common: String
        }
    }
    
    struct Flags: Codable {
        let png: String?
        let svg: String?
        let alt: String?
    }
    
    struct Currency: Codable {
        let name: String
        let symbol: String?
    }
    
    struct IDD: Codable {
        let root: String?
        let suffixes: [String]?
    }
    
    struct Demonym: Codable {
        let f: String
        let m: String
    }
    
    struct Car: Codable {
        let signs: [String]?
        let side: String?
    }
    
    struct CoatOfArms: Codable {
        let png: String?
        let svg: String?
    }
    
    struct CapitalInfo: Codable {
        let latlng: [Double]?
    }
    
    struct PostalCode: Codable {
        let format: String?
        let regex: String?
    }
}

// MARK: - Unsplash Response
struct UnsplashSearchResponse: Codable {
    let total: Int
    let totalPages: Int
    let results: [UnsplashPhoto]
    
    enum CodingKeys: String, CodingKey {
        case total
        case totalPages = "total_pages"
        case results
    }
}

struct UnsplashPhoto: Codable {
    let id: String
    let urls: PhotoUrls
    let user: PhotoUser
    let description: String?
    
    struct PhotoUrls: Codable {
        let raw: String
        let full: String
        let regular: String
        let small: String
        let thumb: String
    }
    
    struct PhotoUser: Codable {
        let name: String
        let username: String
    }
}

struct WeatherResponse: Codable {
    let main: WeatherMain
    let weather: [Weather]
    let name: String
    
    struct WeatherMain: Codable {
        let temp: Double
        let feelsLike: Double
        let tempMin: Double
        let tempMax: Double
        let humidity: Int
        
        enum CodingKeys: String, CodingKey {
            case temp
            case feelsLike = "feels_like"
            case tempMin = "temp_min"
            case tempMax = "temp_max"
            case humidity
        }
    }
    
    struct Weather: Codable {
        let id: Int
        let main: String
        let description: String
        let icon: String
    }
}

struct WikipediaSummary: Codable {
    let title: String
    let extract: String
    let thumbnail: Thumbnail?
    
    struct Thumbnail: Codable {
        let source: String
        let width: Int
        let height: Int
    }
}
