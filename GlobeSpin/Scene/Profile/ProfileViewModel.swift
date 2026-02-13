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
        case updateSuccess
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
        
        viewState?(.loading)
        
        userService.getUserData(userId: userId, forceRefresh: forceRefresh) { [weak self] userData, fetchError in
            if let fetchError = fetchError {
                self?.viewState?(.error(fetchError.localizedDescription))
                return
            }
            
            if let userData = userData {
                self?.viewState?(.success(fullName: userData.fullName, email: userData.email))
            } else {
                self?.viewState?(.error("No user data found"))
            }
        }
    }
    
    func updateUserName(newName: String) {
        guard let userId = authService.getCurrentUserId() else {
            viewState?(.error("Unable to update user data"))
            return
        }
        
        viewState?(.loading)
        
        userService.updateUserData(userId: userId, fullName: newName) { [weak self] updateError in
            if let updateError = updateError {
                self?.viewState?(.error("Failed to update name: \(updateError.localizedDescription)"))
                return
            }
            
            self?.viewState?(.updateSuccess)
        }
    }
    
    func navigateToEditProfile() {
        coordinator.showEditProfile(viewModel: self)
    }
    
    func navigateToTermsOfService() {
        coordinator.showTermsOfService()
    }
    
    func navigateToPrivacyPolicy() {
        coordinator.showPrivacyPolicy()
    }
    
    func logout() {
        viewState?(.loading)
        
        authService.logOut { [weak self] logoutError in
            if let logoutError = logoutError {
                self?.viewState?(.error("Failed to log out: \(logoutError.localizedDescription)"))
                return
            }
            
            self?.userService.clearCache()
            self?.coordinator.showSplash()
        }
    }
}
