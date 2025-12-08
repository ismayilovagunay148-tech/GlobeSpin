//
//  LoginCoordinator.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 01.12.25.
//

import UIKit

class LoginCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vm = LoginViewModel(coordinator: self)
        let vc = LoginController(viewModel: vm)
        navigationController.show(vc, sender: nil)
    }
    
    func showSignUp() {
        let coordinator = SignUpCoordinator(navigationController: navigationController)
        coordinator.start()
    }
    
    func showTabBar() {
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate,
              let window = sceneDelegate.window else {
            return
        }
        
        let tabBarController = TabBarController()
        window.rootViewController = tabBarController
        
        UIView.transition(with: window,
                         duration: 0.3,
                         options: .transitionCrossDissolve,
                         animations: nil,
                         completion: nil)
    }
}
