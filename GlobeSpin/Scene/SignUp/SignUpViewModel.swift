//
//  SignUpViewModel.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 28.11.25.
//

import Foundation

final class SignUpViewModel {
    
    private let coordinator: SignUpCoordinator
    private let authService = AuthService.shared
    
    var error: ((String) -> Void)?
    var loading: ((Bool) -> Void)?
    
    init(coordinator: SignUpCoordinator) {
        self.coordinator = coordinator
    }
    
    func signUpWithEmail(fullName: String, email: String, password: String, confirmPassword: String) {
        guard !fullName.isEmpty else {
            error?("Please enter your full name")
            return
        }
        
        guard fullName.count >= 2 else {
            error?("Full name must be at least 2 characters")
            return
        }
        
        guard !email.isEmpty else {
            error?("Please enter your email address")
            return
        }
        
        guard email.isValidEmail else {
            error?("Please enter a valid email address")
            return
        }
        
        guard !password.isEmpty else {
            error?("Please enter a password")
            return
        }
        
        guard password.count >= 6 else {
            error?("Password must be at least 6 characters")
            return
        }
        
        guard !confirmPassword.isEmpty else {
            error?("Please confirm your password")
            return
        }
        
        guard password == confirmPassword else {
            error?("Passwords do not match")
            return
        }
        
        loading?(true)
        
        authService.signUp(email: email, password: password) { [weak self] userId, authError in
            DispatchQueue.main.async {
                self?.loading?(false)
                
                if let authError = authError {
                    self?.error?(authError.localizedDescription)
                    return
                }
                
                if let userId = userId {
                    print("User signed up: \(userId)")
                    self?.coordinator.showRoulette()
                }
            }
        }
    }
}
