//
//  FirebaseImageStorageAdapter.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 28.01.26.
//

import UIKit
import FirebaseStorage
import Alamofire

final class FirebaseImageStorageAdapter: ImageStorageUseCase {
    
    private let storage = Storage.storage()
    private let compressionQuality: CGFloat = 0.6
    
    func uploadProfileImage(userId: String, image: UIImage, completion: @escaping (Error?) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: compressionQuality) else {
            completion(ImageStorageError.compressionFailed)
            return
        }
        
        let storageRef = storage.reference()
        let profileImageRef = storageRef.child("profile_images/\(userId).jpg")
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        profileImageRef.putData(imageData, metadata: metadata) { _, error in
            completion(error)
        }
    }
    
    func downloadProfileImage(userId: String, completion: @escaping (UIImage?, Error?) -> Void) {
        let storageRef = storage.reference()
        let profileImageRef = storageRef.child("profile_images/\(userId).jpg")
        
        profileImageRef.downloadURL { url, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let url = url else {
                completion(nil, ImageStorageError.downloadFailed)
                return
            }
            
            AF.request(url).responseData { response in
                switch response.result {
                case .success(let data):
                    guard let image = UIImage(data: data) else {
                        completion(nil, ImageStorageError.invalidImageData)
                        return
                    }
                    completion(image, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
        }
    }
    
    func deleteProfileImage(userId: String, completion: @escaping (Error?) -> Void) {
        let storageRef = storage.reference()
        let profileImageRef = storageRef.child("profile_images/\(userId).jpg")
        
        profileImageRef.delete { error in
            completion(error)
        }
    }
}

enum ImageStorageError: LocalizedError {
    case compressionFailed
    case downloadFailed
    case invalidImageData
    
    var errorDescription: String? {
        switch self {
        case .compressionFailed:
            return "Failed to compress image"
        case .downloadFailed:
            return "Failed to download image"
        case .invalidImageData:
            return "Invalid image data"
        }
    }
}
