//
//  Trainer.swift
//  Orienti
//
//  Created by Kryštof Kiss on 26/09/2021.
//

import Foundation

class Trainer: User {
    let surname: String
    let teamId: UUID
    let email: String
    
    init(id: UUID, name: String, surname: String, teamId: UUID, email: String) {
        self.surname = surname
        self.teamId = teamId
        self.email = email
        super.init(id: id, name: name)
    }
}
