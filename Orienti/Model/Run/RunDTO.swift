//
//  RunDTO.swift
//  Orienti
//
//  Created by Kryštof Kiss on 26/09/2021.
//

import Foundation

struct RunDTO: Codable {
    let id: UUID
    let trackId: UUID
    let startedAt: Date
    let finishedAt: Date
    let runner: UserDTO
    let controlPoints: [ControlPointInstanceDTO]
}

struct RunDTOMapper: DTOMapper {
    typealias DTOType = RunDTO
    typealias ObjectType = Run
    
    static func map(_ dto: RunDTO) -> Run? {
        let controlPoints = dto.controlPoints.compactMap {
            ControlPointInstanceDTOMapper.map($0)
        }
        
        guard let runner = UserDTOMapper.map(dto.runner) as? Runner else { return nil }
        
        return Run(
            id: dto.id,
            trackId: dto.trackId,
            startedAt: dto.startedAt,
            finishedAt: dto.finishedAt,
            runner: runner,
            controlPoints: controlPoints
        )
    }
    
    static func map(_ obj: Run) -> RunDTO? {
        let controlPoints = obj.controlPoints.compactMap {
            ControlPointInstanceDTOMapper.map($0)
        }
        
        guard let runner = UserDTOMapper.map(obj.runner) else { return nil }
        
        return RunDTO(
            id: obj.id,
            trackId: obj.trackId,
            startedAt: obj.startedAt,
            finishedAt: obj.finishedAt,
            runner: runner,
            controlPoints: controlPoints
        )
    }
}
