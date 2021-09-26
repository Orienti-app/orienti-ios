//
//  ControlPointInstance.swift
//  Orienti
//
//  Created by Kryštof Kiss on 26/09/2021.
//

import Foundation

class ControlPointInstance {
    let id: UUID
    let timestamp: Date
    
    init(id: UUID, timestamp: Date) {
        self.id = id
        self.timestamp = timestamp
    }
}
