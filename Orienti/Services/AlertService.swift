//
//  AlertService.swift
//  Orienti
//
//  Created by Kryštof Kiss on 02/12/2022.
//

import UIKit

extension UIApplication {
    class var keyWindow: UIWindow {
        UIApplication.shared.windows.filter { $0.isKeyWindow }.first!
    }

    class var topVC: UIViewController {
        get {
            keyWindow.rootViewController!
        } set {
            keyWindow.rootViewController = newValue
        }
    }
}

extension UIAlertController {
    func show() {
        DispatchQueue.main.async {
            if let modalController = UIApplication.topVC.presentedViewController {
                modalController.present(self, animated: true, completion: nil)
            } else {
                UIApplication.topVC.present(self, animated: true, completion: nil)
            }
        }
    }
}

final class AlertService {
    class func showAlert(title: String = "Something went wrong :(", message: String = "") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK".localized.uppercased(), style: .default, handler: nil)
        alert.addAction(defaultAction)

        alert.show()
    }

    class func showConfirmationDialog(title: String, message: String, confirmCompletion: @escaping () -> Void, cancelCompletion: @escaping () -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Confirm".localized, style: .default) { _ in
            confirmCompletion()
        }

        let cancelAction = UIAlertAction(title: "Cancel".localized, style: .destructive) { _ in
            cancelCompletion()
        }

        alert.addAction(confirmAction)
        alert.addAction(cancelAction)

        alert.show()
    }
}
