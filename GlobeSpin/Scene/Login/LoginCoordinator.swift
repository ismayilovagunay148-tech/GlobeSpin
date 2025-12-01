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
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showSignUp() {
        let coordinator = SignUpCoordinator(navigationController: navigationController)
        coordinator.start()
    }
    
    func showRoulette() {
        let coordinator = RouletteCoordinator(navigationController: navigationController)
        coordinator.start()
    }
}
