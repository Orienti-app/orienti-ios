//
//  TrainingDTO.swift
//  Orienti
//
//  Created by Kryštof Kiss on 26/09/2021.
//

import Foundation

struct TrainingDTO: Codable {
    let id: UUID
    let name: String
    let createdAt: Date
    let updatedAt: Date
    let runs: [RunDTO]
}

struct TrainingDTOMapper: DTOMapper {
    typealias DTOType = TrainingDTO
    typealias ObjectType = Training
    
    static func map(_ dto: TrainingDTO) -> Training? {
        let runs = dto.runs.compactMap {
            RunDTOMapper.map($0)
        }
        
        return Training(
            id: dto.id,
            name: dto.name,
            createdAt: dto.createdAt,
            updatedAt: dto.updatedAt,
            runs: runs
        )
    }
    
    static func map(_ obj: Training) -> TrainingDTO? {
        let runs = obj.runs.compactMap {
            RunDTOMapper.map($0)
        }
        
        return TrainingDTO(
            id: obj.id,
            name: obj.name,
            createdAt: obj.createdAt,
            updatedAt: obj.updatedAt,
            runs: runs
        )
    }
}
