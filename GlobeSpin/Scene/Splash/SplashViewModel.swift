//
//  SplashViewModel.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 11.11.25.
//

import Foundation

final class SplashViewModel {
    
    private let coordinator: SplashCoordinator
    
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    init(coordinator: SplashCoordinator) {
        self.coordinator = coordinator
    }
    
    func navigateToLogin() {
        coordinator.showLogin()
    }
}
