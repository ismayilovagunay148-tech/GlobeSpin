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
    
    func showConfirmationAlert(
            title: String,
            message: String,
            confirmTitle: String = "Confirm",
            confirmStyle: UIAlertAction.Style = .default,
            cancelTitle: String = "Cancel",
            onConfirm: @escaping () -> Void
        ) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: cancelTitle, style: .cancel))
            alert.addAction(UIAlertAction(title: confirmTitle, style: confirmStyle) { _ in
                onConfirm()
            })
            
            present(alert, animated: true)
        }
}
