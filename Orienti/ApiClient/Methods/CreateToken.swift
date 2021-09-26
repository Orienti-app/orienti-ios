//
//  CreateToken.swift
//  Orienti
//
//  Created by Kryštof Kiss on 26/09/2021.
//

import Foundation

// MARK: - Response
struct CreateTokenResponse: Codable {
    let id: UUID
    let user: UserDTO
    let expireAt: Date
}

// MARK: - Request
struct CreateTokenRequest: Codable {
    let username: String
    let password: String
}

// MARK: - RequestParams Extension
extension CreateTokenRequest: RequestParams {
    
    func encode() -> String? {
        return nil
    }
    
}

// MARK: - ApiEndpoint Extension
extension CreateTokenRequest: ApiEndpoint {
    func endpoint() -> String {
        return "/token"
    }
    func dispatch(
        onSuccess sucessHandler: @escaping (SingleResponse<CreateTokenResponse>?) -> Void,
        onFailure failureHandler: @escaping (ApiRequest.ApiError) -> Void
    ) {
        ApiRequest.shared.post(request: self, onSuccess: sucessHandler, onFailure: failureHandler)
    }
}
