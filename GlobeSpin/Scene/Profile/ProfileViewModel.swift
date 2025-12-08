//
//  ProfileViewModel.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 07.12.25.
//

import Foundation

final class ProfileViewModel {
    
    private let coordinator: ProfileCoordinator
    private let authService = AuthService.shared
    private let userService = UserService.shared
    
    var userDataUpdated: ((String, String) -> Void)?
    var error: ((String) -> Void)?
    var loading: ((Bool) -> Void)?
    
    init(coordinator: ProfileCoordinator) {
        self.coordinator = coordinator
    }
    
    func loadUserData() {
        guard let userId = authService.getCurrentUserId() else {
            error?("Unable to load user data")
            return
        }
        
        print("Loading user data for userId: \(userId)")
        loading?(true)
        
        userService.getUserData(userId: userId) { [weak self] userData, fetchError in
            DispatchQueue.main.async {
                self?.loading?(false)
                
                if let fetchError = fetchError {
                    print("Error fetching user data: \(fetchError.localizedDescription)")
                    self?.error?(fetchError.localizedDescription)
                    return
                }
                
                if let userData = userData {
                    print("User data loaded successfully - Name: \(userData.fullName), Email: \(userData.email)")
                    self?.userDataUpdated?(userData.fullName, userData.email)
                } else {
                    print("No user data found")
                    self?.error?("No user data found")
                }
            }
        }
    }
    
    func logout() {
        loading?(true)
        
        authService.logOut { [weak self] error in
            DispatchQueue.main.async {
                self?.loading?(false)
                
                if let error = error {
                    self?.error?("Failed to log out: \(error.localizedDescription)")
                    return
                }
                
                self?.coordinator.showSplash()
            }
        }
    }
}
