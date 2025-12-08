//
//  AuthService.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 03.12.25.
//

import Foundation

class AuthService {
    
    static let shared = AuthService()
    
    private let authAdapter: AuthenticationUseCase
    
    private init(authAdapter: AuthenticationUseCase = FirebaseAuthAdapter()) {
        self.authAdapter = authAdapter
    }
    
    func signUp(email: String, password: String, completion: @escaping (String?, Error?) -> Void) {
        authAdapter.signUp(email: email, password: password, completion: completion)
    }
    
    func logIn(email: String, password: String, completion: @escaping (String?, Error?) -> Void) {
        authAdapter.logIn(email: email, password: password, completion: completion)
    }
    
    func logOut(completion: @escaping (Error?) -> Void) {
        authAdapter.logOut(completion: completion)
    }
    
    func isUserLoggedIn() -> Bool {
        return authAdapter.isUserLoggedIn()
    }
    
    func getCurrentUserId() -> String? {
        return authAdapter.getCurrentUser()
    }
}
