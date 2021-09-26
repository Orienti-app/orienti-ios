//
//  ErrorResponse.swift
//  Orienti
//
//  Created by Kryštof Kiss on 26/09/2021.
//

struct ErrorResponse<T: Decodable>: Decodable {
    let errors: T
}
