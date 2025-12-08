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
    
    private func setupTabBar() {
        tabBar.backgroundColor = .systemBackground
        tabBar.tintColor = UIColor(red: 0.4, green: 0.7, blue: 0.85, alpha: 1.0)
        tabBar.unselectedItemTintColor = .systemGray
        
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -2)
        tabBar.layer.shadowRadius = 4
        tabBar.layer.shadowOpacity = 0.1
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
        
        let exploreNav = UINavigationController()
        let exploreVC = createPlaceholderViewController(title: "Explore", icon: "🗺️")
        exploreNav.setViewControllers([exploreVC], animated: false)
        exploreNav.tabBarItem = UITabBarItem(
            title: "Explore",
            image: UIImage(systemName: "map"),
            selectedImage: UIImage(systemName: "map.fill")
        )
        
        let tripsNav = UINavigationController()
        let tripsVC = createPlaceholderViewController(title: "My Trips", icon: "✈️")
        tripsNav.setViewControllers([tripsVC], animated: false)
        tripsNav.tabBarItem = UITabBarItem(
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
        
        viewControllers = [rouletteNav, exploreNav, tripsNav, profileNav]
    }
    
    private func createPlaceholderViewController(title: String, icon: String) -> UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = .systemBackground
        vc.title = title
        
        let label = UILabel()
        label.text = "\(icon)\n\(title)\nComing Soon"
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        vc.view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor)
        ])
        
        return vc
    }
}
