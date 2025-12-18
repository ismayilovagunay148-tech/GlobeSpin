//
//  LoginViewModel.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 28.11.25.
//

import Foundation
import UIKit

import Foundation

final class LoginViewModel {
    
    private let coordinator: LoginCoordinator
    private let authService = AuthService.shared
    private let socialAuthService = SocialAuthService.shared
    
    var error: ((String) -> Void)?
    var loading: ((Bool) -> Void)?

    init(coordinator: LoginCoordinator) {
        self.coordinator = coordinator
    }
    
    func loginWithApple() {
        loading?(true)
        
        socialAuthService.signInWithApple { [weak self] userId, authError in
            self?.loading?(false)
            
            if let authError = authError {
                let nsError = authError as NSError
                if nsError.code == 1001 || nsError.domain == "com.apple.AuthenticationServices.AuthorizationError" {
                    return
                }
                self?.error?(authError.localizedDescription)
                return
            }
            
            if userId != nil {
                self?.coordinator.showTabBar()
            }
        }
    }
    
    func loginWithGoogle() {
        loading?(true)
        
        socialAuthService.signInWithGoogle { [weak self] userId, authError in
            self?.loading?(false)
            
            if let authError = authError {
                let nsError = authError as NSError
                if nsError.code == -5 {
                    return
                }
                self?.error?(authError.localizedDescription)
                return
            }
            
            if userId != nil {
                self?.coordinator.showTabBar()
            }
        }
    }
    
    func loginWithEmail(email: String, password: String) {
        guard !email.isEmpty, !password.isEmpty else {
            error?("Please fill all fields")
            return
        }
        
        guard email.isValidEmail else {
            error?("Please enter a valid email address")
            return
        }
        
        loading?(true)
        
        authService.logIn(email: email, password: password) { [weak self] userId, authError in
            self?.loading?(false)
            
            if let authError = authError {
                self?.error?(authError.localizedDescription)
                return
            }
            
            if userId != nil {
                self?.coordinator.showTabBar()
            }
        }
    }
    
    func navigateToSignUp() {
        coordinator.showSignUp()
    }
}
