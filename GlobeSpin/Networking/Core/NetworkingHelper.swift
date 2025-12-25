//
//  NetworkingHelper.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 11.11.25.
//

import Foundation
import Alamofire

final class NetworkingHelper {
    
    private let baseURL = "http://localhost:3000/"
    
    static let shared = NetworkingHelper()
    
    private init() {}
    
    func configureURL(endpoint: String) -> String {
        return baseURL + endpoint
    }
}
