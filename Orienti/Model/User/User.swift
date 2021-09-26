//
//  User.swift
//  Orienti
//
//  Created by Kryštof Kiss on 25/09/2021.
//

import Foundation

class User {
    let id: UUID
    let name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
