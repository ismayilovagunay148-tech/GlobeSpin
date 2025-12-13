//
//  ProfileViewModel.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 07.12.25.
//

import Foundation

final class ProfileViewModel {
    
    enum ViewState {
        case idle
        case loading
        case success(fullName: String, email: String)
        case error(String)
    }
    
    private let coordinator: ProfileCoordinator
    private let authService = AuthService.shared
    private let userService = UserService.shared
    
    var viewState: ((ViewState) -> Void)?
    
    init(coordinator: ProfileCoordinator) {
        self.coordinator = coordinator
    }
    
    func loadUserData(forceRefresh: Bool = false) {
        guard let userId = authService.getCurrentUserId() else {
            viewState?(.error("Unable to load user data"))
            return
        }
        
        print("Loading user data for userId: \(userId)")
        viewState?(.loading)
        
        userService.getUserData(userId: userId, forceRefresh: forceRefresh, completion: { [weak self] userData, fetchError in
            DispatchQueue.main.async {
                if let fetchError = fetchError {
                    print("Error fetching user data: \(fetchError.localizedDescription)")
                    self?.viewState?(.error(fetchError.localizedDescription))
                    return
                }
                
                if let userData = userData {
                    print("User data loaded successfully - Name: \(userData.fullName), Email: \(userData.email)")
                    self?.viewState?(.success(fullName: userData.fullName, email: userData.email))
                } else {
                    print("No user data found")
                    self?.viewState?(.error("No user data found"))
                }
            }
        })
    }
    
    func logout() {
        viewState?(.loading)
        
        authService.logOut(completion: { [weak self] logoutError in
            DispatchQueue.main.async {
                if let logoutError = logoutError {
                    self?.viewState?(.error("Failed to log out: \(logoutError.localizedDescription)"))
                    return
                }
                
                self?.userService.clearCache()
                self?.coordinator.showSplash()
            }
        })
    }
}
