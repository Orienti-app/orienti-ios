//
//  PaginationResponse.swift
//  Orienti
//
//  Created by Kryštof Kiss on 26/09/2021.
//

struct PaginationResponse<T: Decodable>: Decodable {
    let items: [T]
}
