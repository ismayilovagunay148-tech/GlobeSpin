//
//  UserService.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 07.12.25.
//

import Foundation

class UserService {
    
    static let shared = UserService()
    
    private let userDataAdapter: UserDataUseCase
    private var cachedUserData: UserModel?
    
    init(userDataAdapter: UserDataUseCase = FirebaseUserDataAdapter()) {
        self.userDataAdapter = userDataAdapter
    }
    
    func saveUserData(userId: String, fullName: String, email: String, completion: @escaping (Error?) -> Void) {
        userDataAdapter.saveUserData(userId: userId, fullName: fullName, email: email) { [weak self] error in
            if error == nil {
                self?.cachedUserData = UserModel(userId: userId, fullName: fullName, email: email)
            }
            completion(error)
        }
    }
    
    func getUserData(userId: String, forceRefresh: Bool = false, completion: @escaping (UserModel?, Error?) -> Void) {
        if !forceRefresh, let cached = cachedUserData, cached.userId == userId {
            completion(cached, nil)
            return
        }
        
        userDataAdapter.getUserData(userId: userId) { [weak self] userData, error in
            if let userData = userData {
                self?.cachedUserData = userData
            }
            completion(userData, error)
        }
    }
    
    func updateUserData(userId: String, fullName: String, completion: @escaping (Error?) -> Void) {
        userDataAdapter.updateUserData(userId: userId, fullName: fullName) { [weak self] error in
            if error == nil, let email = self?.cachedUserData?.email {
                self?.cachedUserData = UserModel(userId: userId, fullName: fullName, email: email)
            }
            completion(error)
        }
    }
    
    func deleteUserData(userId: String, completion: @escaping (Error?) -> Void) {
        userDataAdapter.deleteUserData(userId: userId) { [weak self] error in
            if error == nil {
                self?.cachedUserData = nil
            }
            completion(error)
        }
    }
    
    func clearCache() {
        cachedUserData = nil
    }
}
