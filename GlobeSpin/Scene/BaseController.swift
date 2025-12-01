//
//  BaseController.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 10.11.25.
//

import UIKit

class BaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureConstraints()
        configureViewModel()
    }
    
    func configureUI() {}
    
    func configureConstraints() {}
    
    func configureViewModel() {}
}
