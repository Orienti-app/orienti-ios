//
//  UserDTO.swift
//  Orienti
//
//  Created by Kryštof Kiss on 26/09/2021.
//

import Foundation

struct UserDTO: Codable {
    let id: UUID
    let teamId: UUID?
    let name: String
    let surname: String?
    let email: String?
}

struct UserDTOMapper: DTOMapper {
    typealias DTOType = UserDTO
    typealias ObjectType = User
    
    static func map(_ dto: UserDTO) -> User? {
        var user: User?
        
        if let surname = dto.surname, let teamId = dto.teamId, let email = dto.email {
            user = Trainer(
                id: dto.id,
                name: dto.name,
                surname: surname,
                teamId: teamId,
                email: email
            )
        } else {
            user = Runner(id: dto.id, name: dto.name)
        }
        
        return user
    }
    
    static func map(_ obj: User) -> UserDTO? {
        var userDTO: UserDTO?
        
        if obj is Runner {
            let obj = obj as! Runner
            userDTO = UserDTO(
                id: obj.id,
                teamId: nil,
                name: obj.name,
                surname: nil,
                email: nil
            )
        } else if obj is Trainer {
            let obj = obj as! Trainer
            userDTO = UserDTO(
                id: obj.id,
                teamId: obj.teamId,
                name: obj.name,
                surname: obj.surname,
                email: obj.email
            )
        }
        
        return userDTO
    }
}
