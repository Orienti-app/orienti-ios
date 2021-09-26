//
//  ControlPointDTO.swift
//  Orienti
//
//  Created by Kryštof Kiss on 26/09/2021.
//

import Foundation

struct ControlPointDTO: Codable {
    let id: UUID
    let code: String
    let name: String
    let updatedAt: Date
}

struct ControlPointDTOMapper: DTOMapper {
    typealias DTOType = ControlPointDTO
    typealias ObjectType = ControlPoint
    
    static func map(_ dto: ControlPointDTO) -> ControlPoint? {
        return ControlPoint(
            id: dto.id,
            code: dto.code,
            name: dto.name,
            updatedAt: dto.updatedAt
        )
    }
    
    static func map(_ obj: ControlPoint) -> ControlPointDTO? {
        return ControlPointDTO(
            id: obj.id,
            code: obj.code,
            name: obj.name,
            updatedAt: obj.updatedAt
        )
    }
}
