//
//  ProfileCoordinator.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 07.12.25.
//

import UIKit

class ProfileCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vm = ProfileViewModel(coordinator: self)
        let vc = ProfileController(viewModel: vm)
        navigationController.show(vc, sender: nil)
    }
    
    func showSplash() {
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate,
              let window = sceneDelegate.window else {
            return
        }
        
        let navigationController = UINavigationController()
        let splashCoordinator = SplashCoordinator(navigationController: navigationController)
        splashCoordinator.start()
        
        window.rootViewController = navigationController
        
        UIView.transition(with: window,
                         duration: 0.3,
                         options: .transitionCrossDissolve,
                         animations: nil,
                         completion: nil)
    }
}
