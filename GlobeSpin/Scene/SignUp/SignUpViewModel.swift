//
//  SignUpViewModel.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 28.11.25.
//

import Foundation

final class SignUpViewModel {
    
    private let coordinator: SignUpCoordinator
    
    var error: ((String) -> Void)?
    
    init(coordinator: SignUpCoordinator) {
        self.coordinator = coordinator
    }
    
    func signUpWithEmail(fullName: String, email: String, password: String, confirmPassword: String) {
        if fullName.isEmpty {
            error?("Please enter your full name")
            return
        }
        
        if fullName.count < 2 {
            error?("Full name must be at least 2 characters")
            return
        }
        
        if email.isEmpty {
            error?("Please enter your email address")
            return
        }
        
        if !isValidEmail(email) {
            error?("Please enter a valid email address")
            return
        }
        
        if password.isEmpty {
            error?("Please enter a password")
            return
        }
        
        if password.count < 6 {
            error?("Password must be at least 6 characters")
            return
        }
        
        if confirmPassword.isEmpty {
            error?("Please confirm your password")
            return
        }
        
        if password != confirmPassword {
            error?("Passwords do not match")
            return
        }
        
        UserSessionManager.shared.login()
        coordinator.showRoulette()
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}
