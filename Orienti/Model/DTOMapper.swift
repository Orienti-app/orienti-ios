//
//  DTOMapper.swift
//  Orienti
//
//  Created by Kryštof Kiss on 26/09/2021.
//

protocol DTOMapper {
    associatedtype DTOType
    associatedtype ObjectType
    static func map(_ dto: DTOType) -> ObjectType?
    static func map(_ obj: ObjectType) -> DTOType?
}
