//
//  Training.swift
//  Orienti
//
//  Created by Kryštof Kiss on 26/09/2021.
//

import Foundation

class Training {
    let id: UUID
    let name: String
    let createdAt: Date
    let updatedAt: Date
    let runs: [Run]
    
    init(id: UUID, name: String, createdAt: Date, updatedAt: Date, runs: [Run]) {
        self.id = id
        self.name = name
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.runs = runs
    }
}
