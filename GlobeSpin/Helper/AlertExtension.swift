//
//  Alert+Extension.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 29.11.25.
//

import UIKit

extension UIViewController {
    func showAlert(title: String = "Error", message: String, actionTitle: String = "OK") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: .default))
        present(alert, animated: true)
    }
}
