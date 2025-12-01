//
//  Coordinator.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 11.11.25.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    
    func start()
}
