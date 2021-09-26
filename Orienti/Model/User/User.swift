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
    let surname: String
    
    init(id: UUID, name: String, surname: String) {
        self.id = id
        self.name = name
        self.surname = surname
    }
}
