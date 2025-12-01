//
//  UserSessionManager.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 01.12.25.
//


import Foundation

class UserSessionManager {
    static let shared = UserSessionManager()
    
    private let userDefaultsKey = "isUserLoggedIn"
    
    private init() {}
    
    var isLoggedIn: Bool {
        get {
            return UserDefaults.standard.bool(forKey: userDefaultsKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: userDefaultsKey)
        }
    }
    
    func login() {
        isLoggedIn = true
    }
    
    func logout() {
        isLoggedIn = false
    }
}