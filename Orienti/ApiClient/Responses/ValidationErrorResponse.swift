//
//  ValidationErrorResponse.swift
//  Orienti
//
//  Created by Kryštof Kiss on 26/09/2021.
//

struct ValidationErrorResponse: Decodable {
    let message: String
    let field: String
    let reason: String?
}
