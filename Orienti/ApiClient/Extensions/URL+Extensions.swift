//
//  URL+Extensions.swift
//  Orienti
//
//  Created by Kryštof Kiss on 26/09/2021.
//

import Foundation

extension URL {
    var relativePathWithQuery: String {
        get {
            query != nil ? (relativePath + "/?" + (query ?? "")) : (relativePath + "/")
        }
    }
}
