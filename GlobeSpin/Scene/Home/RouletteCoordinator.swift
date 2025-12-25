//
//  RouletteCoordinator.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 01.12.25.
//

import UIKit

class RouletteCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vm = RouletteViewModel(coordinator: self)  
        let vc = RouletteController(viewModel: vm)
        navigationController.show(vc, sender: nil)
    }
    
    func showCountryDetail(country: Country) {
        let detailCoordinator = CountryDetailCoordinator(navigationController: navigationController, country: country)
        detailCoordinator.start()
    }
}
