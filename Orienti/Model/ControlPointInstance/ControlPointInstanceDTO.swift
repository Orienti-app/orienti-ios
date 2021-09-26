//
//  ControlPointInstanceDTO.swift
//  Orienti
//
//  Created by Kryštof Kiss on 26/09/2021.
//

import Foundation

struct ControlPointInstanceDTO: Codable {
    let id: UUID
    let timestamp: Date
}

struct ControlPointInstanceDTOMapper: DTOMapper {
    typealias DTOType = ControlPointInstanceDTO
    typealias ObjectType = ControlPointInstance
    
    static func map(_ dto: ControlPointInstanceDTO) -> ControlPointInstance? {
        return ControlPointInstance(id: dto.id, timestamp: dto.timestamp)
    }
    
    static func map(_ obj: ControlPointInstance) -> ControlPointInstanceDTO? {
        return ControlPointInstanceDTO(id: obj.id, timestamp: obj.timestamp)
    }
}
