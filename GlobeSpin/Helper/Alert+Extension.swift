//
//  Alert+Extension.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 29.11.25.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        })
        present(alert, animated: true)
    }
    
    func showError(_ message: String, completion: (() -> Void)? = nil) {
        showAlert(title: "Error", message: message, completion: completion)
    }
    
    func showSuccess(_ message: String, completion: (() -> Void)? = nil) {
        showAlert(title: "Success", message: message, completion: completion)
    }
         
}
