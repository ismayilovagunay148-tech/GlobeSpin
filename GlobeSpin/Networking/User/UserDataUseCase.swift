//
//  UserDataUseCase.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 10.12.25.
//

import Foundation

protocol UserDataUseCase {
    func saveUserData(userId: String, fullName: String, email: String, completion: @escaping (Error?) -> Void)
    func getUserData(userId: String, completion: @escaping (UserModel?, Error?) -> Void)
    func updateUserData(userId: String, fullName: String, completion: @escaping (Error?) -> Void)
    func deleteUserData(userId: String, completion: @escaping (Error?) -> Void)
}
