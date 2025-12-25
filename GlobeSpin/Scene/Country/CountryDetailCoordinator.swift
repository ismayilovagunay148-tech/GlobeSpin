//
//  CountryDetailCoordinator.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 20.12.25.
//

import UIKit

class CountryDetailCoordinator: Coordinator {
    var navigationController: UINavigationController
    private let country: Country
    
    init(navigationController: UINavigationController, country: Country) {
        self.navigationController = navigationController
        self.country = country
    }
    
    func start() {
        let vm = CountryDetailViewModel(coordinator: self, country: country)
        let vc = CountryDetailController(viewModel: vm)
        navigationController.show(vc, sender: nil)
    }
}
