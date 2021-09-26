//
//  TrackDTO.swift
//  Orienti
//
//  Created by Kryštof Kiss on 26/09/2021.
//

import Foundation

struct TrackDTO: Codable {
    let id: UUID
    let name: String
    let description: String
    let controlPoints: [ControlPointDTO]
}

struct TrackDTOMapper: DTOMapper {
    typealias DTOType = TrackDTO
    typealias ObjectType = Track
    
    static func map(_ dto: TrackDTO) -> Track? {
        let controlPoints = dto.controlPoints.compactMap {
            ControlPointDTOMapper.map($0)
        }
        
        return Track(
            id: dto.id,
            name: dto.name,
            description: dto.description,
            controlPoints: controlPoints
        )
    }
    
    static func map(_ obj: Track) -> TrackDTO? {
        let controlPoints = obj.controlPoints.compactMap {
            ControlPointDTOMapper.map($0)
        }
        
        return TrackDTO(
            id: obj.id,
            name: obj.name,
            description: obj.description,
            controlPoints: controlPoints
        )
    }
}
