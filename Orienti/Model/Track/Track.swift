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
    let description: String
    let controlPoints: [ControlPoint]
    
    init(id: UUID, name: String, description: String, controlPoints: [ControlPoint]) {
        self.id = id
        self.name = name
        self.description = description
        self.controlPoints = controlPoints
    }
}
