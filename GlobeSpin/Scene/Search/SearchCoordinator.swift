//
//  SearchCoordinator.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 23.12.25.
//

import UIKit

class SearchCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vm = SearchViewModel(coordinator: self)
        let vc = SearchController(viewModel: vm)
        navigationController.show(vc, sender: nil)
    }
    
    func showCountryDetail(country: Country) {
        let detailCoordinator = CountryDetailCoordinator(navigationController: navigationController, country: country)
        detailCoordinator.start()
    }
}
