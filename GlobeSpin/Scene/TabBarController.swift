//
//  TabBarController.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 02.12.25.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupViewControllers()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupTabBarShape()
    }
    
    private func setupTabBar() {
        tabBar.backgroundColor = .clear
        tabBar.tintColor = UIColor(red: 0.4, green: 0.7, blue: 0.85, alpha: 1.0)
        tabBar.unselectedItemTintColor = .systemGray
        tabBar.isTranslucent = true
     }
    
    private func setupTabBarShape() {
        let shapeLayer = CAShapeLayer()
        
        let path = UIBezierPath(
            roundedRect: CGRect(
                x: 15,
                y: tabBar.bounds.minY - 10,
                width: tabBar.bounds.width - 30,
                height: tabBar.bounds.height - 10
            ),
            cornerRadius: 30
        )
        
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.systemBackground.cgColor
        shapeLayer.shadowColor = UIColor.black.cgColor
        shapeLayer.shadowOffset = CGSize(width: 0, height: -2)
        shapeLayer.shadowRadius = 10
        shapeLayer.shadowOpacity = 0.1
        
        tabBar.layer.insertSublayer(shapeLayer, at: 0)
        tabBar.itemWidth = (tabBar.bounds.width - 40) / 4
        tabBar.itemPositioning = .centered
    }
    
    private func setupViewControllers() {
        let rouletteNav = UINavigationController()
        let rouletteCoordinator = RouletteCoordinator(navigationController: rouletteNav)
        rouletteCoordinator.start()
        rouletteNav.tabBarItem = UITabBarItem(
            title: "Spin",
            image: UIImage(systemName: "globe"),
            selectedImage: UIImage(systemName: "globe.fill")
        )
        
        let searchNav = UINavigationController()
        let searchCoordinator = SearchCoordinator(navigationController: searchNav)
        searchCoordinator.start()
        searchNav.tabBarItem = UITabBarItem(
            title: "Explore",
            image: UIImage(systemName: "magnifyingglass"),
            selectedImage: UIImage(systemName: "magnifyingglass")
        )
        
        let favoritesNav = UINavigationController()
        let favoritesCoordinator = FavoritesCoordinator(navigationController: favoritesNav)
        favoritesCoordinator.start()
        favoritesNav.tabBarItem = UITabBarItem(
            title: "My Trips",
            image: UIImage(systemName: "airplane"),
            selectedImage: UIImage(systemName: "airplane.circle.fill")
        )
        
        let profileNav = UINavigationController()
        let profileCoordinator = ProfileCoordinator(navigationController: profileNav)
        profileCoordinator.start()
        profileNav.tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(systemName: "person.circle"),
            selectedImage: UIImage(systemName: "person.circle.fill")
        )
        
        viewControllers = [rouletteNav, searchNav, favoritesNav, profileNav]
    }
}
