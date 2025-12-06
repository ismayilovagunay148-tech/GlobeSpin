//
//  LoginViewModel.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 28.11.25.
//

import Foundation

final class LoginViewModel {
    
    private let coordinator: LoginCoordinator
    private let authService = AuthService.shared
    
    var error: ((String) -> Void)?
    var loading: ((Bool) -> Void)?

    init(coordinator: LoginCoordinator) {
        self.coordinator = coordinator
    }
    
    func loginWithApple() {
        error?("Apple Sign In not implemented yet")
    }
    
    func loginWithGoogle() {
        error?("Google Sign In not implemented yet")
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
            DispatchQueue.main.async {
                self?.loading?(false)
                
                if let authError = authError {
                    self?.error?(authError.localizedDescription)
                    return
                }
                
                if let userId = userId {
                    print("User logged in: \(userId)")
                    self?.coordinator.showRoulette()
                }
            }
        }
    }
    
    func navigateToSignUp() {
        coordinator.showSignUp()
    }
}
