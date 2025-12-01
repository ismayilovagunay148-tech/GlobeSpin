//
//  SignUpCoordinator.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 01.12.25.
//

import UIKit

class SignUpCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vm = SignUpViewModel(coordinator: self)
        let vc = SignUpController(viewModel: vm)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showRoulette() {
        let coordinator = RouletteCoordinator(navigationController: navigationController)
        coordinator.start()
    }
}
