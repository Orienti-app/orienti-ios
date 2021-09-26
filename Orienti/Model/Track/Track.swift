//
//  Track.swift
//  Orienti
//
//  Created by Kryštof Kiss on 26/09/2021.
//

import Foundation

class Track {
    let id: UUID
    let name: String
    let controlPoints: [ControlPoint]
    let updatedAt: Date
    
    init(id: UUID, name: String, controlPoints: [ControlPoint], updatedAt: Date) {
        self.id = id
        self.name = name
        self.controlPoints = controlPoints
        self.updatedAt = updatedAt
    }
}
