//
//  SingleResponse.swift
//  Orienti
//
//  Created by Kryštof Kiss on 26/09/2021.
//

struct SingleResponse<T: Decodable>: Decodable {
    let response: T
}
