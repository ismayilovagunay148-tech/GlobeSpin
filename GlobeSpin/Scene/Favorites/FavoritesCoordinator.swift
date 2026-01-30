//
//  FavoritesCoordinator.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 27.12.25.
//

import UIKit

class FavoritesCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vm = FavoritesViewModel(coordinator: self)
        let vc = FavoritesController(viewModel: vm)
        navigationController.show(vc, sender: nil)
    }
    
    func showCountryDetail(country: Country) {
        let detailCoordinator = CountryDetailCoordinator(navigationController: navigationController, country: country)
        detailCoordinator.start()
    }
}
