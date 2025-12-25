//
//  NetworkManager.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 11.11.25.
//

import Foundation
import Alamofire

class NetworkManager {
    
    func request<T: Codable>(url: String,
                             model: T.Type,
                             method: HTTPMethod = .get,
                             parameters: Parameters? = nil,
                             completion: @escaping ((T?, String?) -> Void)) {
        
        print(url)
        print(parameters ?? "No parameters")
        
        AF.request(url,
                   method: method,
                   parameters: parameters).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                print(data)
                completion(data, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
}
