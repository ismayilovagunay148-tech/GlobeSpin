//
//  ImageStorageUseCase.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 28.01.26.
//

import UIKit

protocol ImageStorageUseCase {
    func uploadProfileImage(userId: String, image: UIImage, completion: @escaping (Error?) -> Void)
    func downloadProfileImage(userId: String, completion: @escaping (UIImage?, Error?) -> Void)
    func deleteProfileImage(userId: String, completion: @escaping (Error?) -> Void)
}
