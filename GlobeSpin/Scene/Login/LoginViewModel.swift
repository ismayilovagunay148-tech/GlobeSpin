//
//  LoginViewModel.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 28.11.25.
//

import Foundation

final class LoginViewModel {
    
    private let coordinator: LoginCoordinator
    
    var error: ((String) -> Void)?
    
    init(coordinator: LoginCoordinator) {
        self.coordinator = coordinator
    }
    
    func loginWithApple() {
        UserSessionManager.shared.login()
        coordinator.showRoulette()
    }
    
    func loginWithGoogle() {
        UserSessionManager.shared.login()
        coordinator.showRoulette()
    }
    
    func loginWithEmail(email: String, password: String) {
        if email.isEmpty || password.isEmpty {
            error?("Please fill all fields")
            return
        }
        
        UserSessionManager.shared.login()
        coordinator.showRoulette()
    }
    
    func navigateToSignUp() {
        coordinator.showSignUp()
    }
}
