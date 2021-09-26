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
    let name: String
    let updatedAt: Date
    
    init(id: UUID, code: String, name: String, updatedAt: Date) {
        self.id = id
        self.code = code
        self.name = name
        self.updatedAt = updatedAt
    }
}
