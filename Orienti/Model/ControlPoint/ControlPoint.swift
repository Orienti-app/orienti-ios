//
//  ControlPoint.swift
//  Orienti
//
//  Created by Kryštof Kiss on 26/09/2021.
//

import Foundation

class ControlPoint {
    let id: UUID
    let code: String
    let description: String
    
    init(id: UUID, code: String, description: String) {
        self.id = id
        self.code = code
        self.description = description
    }
}
