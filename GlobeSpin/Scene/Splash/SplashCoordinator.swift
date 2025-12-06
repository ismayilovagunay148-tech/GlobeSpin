//
//  SplashCoordinator.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 11.11.25.
//

import UIKit

class SplashCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vm = SplashViewModel(coordinator: self)
        let vc = SplashController(viewModel: vm)
        navigationController.show(vc, sender: nil)
    }
    
    func showLogin() {
        let coordinator = LoginCoordinator(navigationController: navigationController)
        coordinator.start()
    }
}
