//
//  AppConstants.swift
//  Orienti
//
//  Created by Kryštof Kiss on 02/12/2022.
//

import UIKit

// MARK: - Shared Keys enumeration for Cocoa bindings, Dictionary Keys, UserDefaults, etc.

enum Colors {
    static let white = UIColor(hex: "#FFFFFF")!
    static let primary = UIColor(hex: "#F76C1B")!
}

enum Styles {
    static let actionButton = UIViewStyle<UIButton> {
        $0.configuration = .filled()
        $0.configuration?.baseBackgroundColor = Colors.primary
        $0.configuration?.baseForegroundColor = Colors.white
        $0.configuration?.buttonSize = .large
        $0.configuration?.imagePlacement = .trailing
        $0.configuration?.imagePadding = 10.0

        $0.configuration?.titleTextAttributesTransformer =
            UIConfigurationTextAttributesTransformer { incoming in
                var outgoing = incoming
                outgoing.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
                return outgoing
            }
    }
}
