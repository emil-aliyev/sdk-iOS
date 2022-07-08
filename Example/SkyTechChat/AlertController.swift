//
//  AlertController.swift
//  SkyTechChat_Example

import Foundation
import UIKit

class AlertController {
    
    static func showError(message: String, in viewController: UIViewController) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            DispatchQueue.main.async {
                alertController.dismiss(animated: true)
            }
        }))
        viewController.present(alertController, animated: true)
    }
}
