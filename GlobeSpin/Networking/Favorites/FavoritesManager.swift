//
//  FavoritesManager.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 27.12.25.
//

import Foundation
import FirebaseFirestore

class FavoritesManager {
    
    static let shared = FavoritesManager()
    
    private let db = Firestore.firestore()
    private let favoritesCollection = "favorites"
    
    private init() {}
    
    func addFavorite(userId: String, country: Country, completion: @escaping (Error?) -> Void) {
        let favoriteData: [String: Any] = [
            "userId": userId,
            "countryName": country.name,
            "capital": country.capital,
            "imageURL": country.imageURL,
            "locationIcon": country.locationIcon,
            "temperatureC": country.weather.temperatureC,
            "temperatureF": country.weather.temperatureF,
            "weatherDescription": country.weather.description,
            "funFact": country.funFact,
            "createdAt": Timestamp(date: Date())
        ]
        
        db.collection(favoritesCollection)
            .document("\(userId)_\(country.name)")
            .setData(favoriteData, completion: completion)
    }
    
    func removeFavorite(userId: String, countryName: String, completion: @escaping (Error?) -> Void) {
        db.collection(favoritesCollection)
            .document("\(userId)_\(countryName)")
            .delete(completion: completion)
    }
    
    func getFavorites(userId: String, completion: @escaping ([Country]?, Error?) -> Void) {
        db.collection(favoritesCollection)
            .whereField("userId", isEqualTo: userId)
            .getDocuments { result, error in
                if let error = error {
                    completion(nil, error)
                    return
                }
                
                guard let docs = result?.documents else {
                    completion([], nil)
                    return
                }
                
                var tempList: [(Country, Date)] = []
                
                for doc in docs {
                    let data = doc.data()
                    
                    guard let name = data["countryName"] as? String,
                          let cap = data["capital"] as? String,
                          let img = data["imageURL"] as? String,
                          let icon = data["locationIcon"] as? String,
                          let tc = data["temperatureC"] as? Int,
                          let tf = data["temperatureF"] as? Double,
                          let wd = data["weatherDescription"] as? String,
                          let fact = data["funFact"] as? String,
                          let ts = data["createdAt"] as? Timestamp else {
                        continue
                    }
                    
                    let weather = Weather(temperatureC: tc, temperatureF: tf, description: wd)
                    let country = Country(name: name, imageURL: img, weather: weather, funFact: fact, capital: cap, locationIcon: icon)
                    
                    tempList.append((country, ts.dateValue()))
                }
                
                tempList.sort { $0.1 > $1.1 }
                var sorted: [Country] = []
                for item in tempList {
                    sorted.append(item.0)
                }
                
                completion(sorted, nil)
            }
    }
    
    func isFavorite(userId: String, countryName: String, completion: @escaping (Bool) -> Void) {
        db.collection(favoritesCollection)
            .document("\(userId)_\(countryName)")
            .getDocument { document, _ in
                completion(document?.exists ?? false)
            }
    }
}
