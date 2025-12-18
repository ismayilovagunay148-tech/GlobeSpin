//
//  SocialAuthService.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 16.12.25.
//

import Foundation
import UIKit

class SocialAuthService {
    
    static let shared = SocialAuthService()
    
    private let googleAdapter: SocialAuthUseCase
    private let appleAdapter: SocialAuthUseCase
    private let userService = UserService.shared
    
    init(googleAdapter: SocialAuthUseCase = GoogleLogInAdapter(),
         appleAdapter: SocialAuthUseCase = AppleLogInAdapter()) {
        self.googleAdapter = googleAdapter
        self.appleAdapter = appleAdapter
    }
    
    func signInWithGoogle(completion: @escaping (String?, Error?) -> Void) {
        googleAdapter.signIn { [weak self] result, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            
            guard let result = result else {
                DispatchQueue.main.async {
                    completion(nil, AuthError.authenticationFailed)
                }
                return
            }
            
            self?.saveUserData(result: result, completion: completion)
        }
    }
    
    func signInWithApple(completion: @escaping (String?, Error?) -> Void) {
        appleAdapter.signIn { [weak self] result, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            
            guard let result = result else {
                DispatchQueue.main.async {
                    completion(nil, AuthError.authenticationFailed)
                }
                return
            }
            
            self?.userService.getUserData(userId: result.userId, forceRefresh: true) { existingUser, _ in
                if existingUser != nil {
                    DispatchQueue.main.async {
                        completion(result.userId, nil)
                    }
                } else {
                    self?.saveUserData(result: result, completion: completion)
                }
            }
        }
    }
    
    private func saveUserData(result: SocialAuthResult, completion: @escaping (String?, Error?) -> Void) {
        let fullName = result.fullName ?? "User"
        let email = result.email ?? "no-email@example.com"
        
        userService.saveUserData(userId: result.userId, fullName: fullName, email: email) { _ in
            DispatchQueue.main.async {
                completion(result.userId, nil)
            }
        }
    }
}
