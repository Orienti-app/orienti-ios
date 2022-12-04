//
//  UIResponder+Extensions.swift
//  Orienti
//
//  Created by Kryštof Kiss on 04/12/2022.
//

import UIKit

extension UIResponder {
    private enum Static {
        weak static var responder: UIResponder?
    }

    /// Finds the current first responder
    /// - Returns: the current UIResponder if it exists
    static func currentFirst() -> UIResponder? {
        Static.responder = nil
        UIApplication.shared.sendAction(#selector(UIResponder._trap), to: nil, from: nil, for: nil)
        return Static.responder
    }

    @objc private func _trap() {
        Static.responder = self
    }
}
