//
//  String+Extensions.swift
//  Orienti
//
//  Created by Kryštof Kiss on 02/12/2022.
//

import Foundation

extension String {
    var localized: String {
        let localizedString = NSLocalizedString(self, comment: "\(self)_comment")
        
        if self != localizedString || NSLocale.preferredLanguages.first == "en" {
            return localizedString
        }
        
        if let path = Bundle.main.path(forResource: "en", ofType: "lproj"), let bundle = Bundle(path: path) {
            return NSLocalizedString(self, bundle: bundle, comment: "")
        }
        
        return self
    }
    
    func localized(_ args: CVarArg...) -> String {
        return String(format: localized, args)
    }
}
