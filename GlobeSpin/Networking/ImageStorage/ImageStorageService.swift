//
//  ImageStorageService.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 28.01.26.
//

import UIKit

final class ImageStorageService {
    
    static let shared = ImageStorageService()
    
    private let imageStorageAdapter: ImageStorageUseCase
    
    init(imageStorageAdapter: ImageStorageUseCase = FirebaseImageStorageAdapter()) {
        self.imageStorageAdapter = imageStorageAdapter
    }
    
    func uploadProfileImage(userId: String, image: UIImage, completion: @escaping (Error?) -> Void) {
        imageStorageAdapter.uploadProfileImage(userId: userId, image: image, completion: completion)
    }
    
    func downloadProfileImage(userId: String, completion: @escaping (UIImage?, Error?) -> Void) {
        imageStorageAdapter.downloadProfileImage(userId: userId, completion: completion)
    }
    
    func deleteProfileImage(userId: String, completion: @escaping (Error?) -> Void) {
        imageStorageAdapter.deleteProfileImage(userId: userId, completion: completion)
    }
}
