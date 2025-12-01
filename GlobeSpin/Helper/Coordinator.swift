//
//  Coordinator.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 11.11.25.
//

import Foundation

class AppCoordinator {
    let navigation: UINavigationController

    init(navigation: UINavigationController) {
        self.navigation = navigation
    }

    func start() {
        let vm = SplashViewModel()
        let vc = SplashController(viewModel: vm, coordinator: self)
        navigation.setViewControllers([vc], animated: false)
    }

    func showLogin() {
        let vm = LoginViewModel()
        let vc = LoginController(viewModel: vm)
        navigation.pushViewController(vc, animated: true)
    }
}
