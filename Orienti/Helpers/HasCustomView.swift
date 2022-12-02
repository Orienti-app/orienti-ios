//
//  HasCustomView.swift
//  Orienti
//
//  Created by Kryštof Kiss on 02/12/2022.
//

import UIKit

protocol HasCustomView {
    associatedtype CustomView: UIView
}

extension HasCustomView where Self: UIViewController {
    /// The UIViewController's custom view.
    var customView: CustomView {
        guard let customView = view as? CustomView else {
            fatalError("Expected view to be of type \(CustomView.self) but got \(type(of: view)) instead")
        }
        return customView
    }
}
