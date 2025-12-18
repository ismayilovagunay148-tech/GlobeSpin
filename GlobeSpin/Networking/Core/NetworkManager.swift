//
//  NetworkManager.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 11.11.25.
//

//import Foundation
//import Alamofire
//
//class NetworkManager {
//    
//    func request<T: Codable>(url: String,
//                             model: T.Type,
//                             method: HTTPMethod = .get,
//                             parameters: Parameters? = nil,
//                             completion: @escaping ((T?, String?) -> Void)) {
//        
//        print("Request URL: \(url)")
//        
//        AF.request(url,
//                   method: method,
//                   parameters: parameters).responseData { response in
//            
//            // Print raw JSON for debugging
//            if let data = response.data {
//                if let jsonString = String(data: data, encoding: .utf8) {
//                    print("Raw Response: \(jsonString.prefix(500))...") // First 500 chars
//                }
//            }
//            
//            switch response.result {
//            case .success(let data):
//                do {
//                    let decoder = JSONDecoder()
//                    let decodedData = try decoder.decode(T.self, from: data)
//                    print("Success")
//                    completion(decodedData, nil)
//                } catch {
//                    print("Decoding Error: \(error)")
//                    if let decodingError = error as? DecodingError {
//                        switch decodingError {
//                        case .keyNotFound(let key, let context):
//                            print("Missing key: \(key.stringValue) - \(context.debugDescription)")
//                        case .typeMismatch(let type, let context):
//                            print("Type mismatch: \(type) - \(context.debugDescription)")
//                        case .valueNotFound(let type, let context):
//                            print("Value not found: \(type) - \(context.debugDescription)")
//                        case .dataCorrupted(let context):
//                            print("Data corrupted: \(context.debugDescription)")
//                        @unknown default:
//                            print("Unknown decoding error")
//                        }
//                    }
//                    completion(nil, error.localizedDescription)
//                }
//            case .failure(let error):
//                print("Network Error: \(error.localizedDescription)")
//                completion(nil, error.localizedDescription)
//            }
//        }
//    }
//    
//    // Custom headers method for Unsplash
//    func requestWithCustomHeaders<T: Codable>(url: String,
//                                              model: T.Type,
//                                              method: HTTPMethod = .get,
//                                              headers: HTTPHeaders,
//                                              parameters: Parameters? = nil,
//                                              completion: @escaping ((T?, String?) -> Void)) {
//        
//        print("Request URL: \(url)")
//        print("Headers: \(headers)")
//        
//        AF.request(url,
//                   method: method,
//                   parameters: parameters,
//                   headers: headers).responseDecodable(of: T.self) { response in
//            switch response.result {
//            case .success(let data):
//                print("Success")
//                completion(data, nil)
//            case .failure(let error):
//                print("Error: \(error.localizedDescription)")
//                completion(nil, error.localizedDescription)
//            }
//        }
//    }
//}
