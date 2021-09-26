//
//  SyncData.swift
//  Orienti
//
//  Created by Kryštof Kiss on 26/09/2021.
//

import Foundation

// MARK: - Response
struct SyncDataResponse: Codable {
    let controlPoints: [ControlPointDTO]
    let tracks: [TrackDTO]
    let trainings: [TrainingDTO]
    let user: UserDTO
}

// MARK: - Request
struct SyncDataRequest: Codable {
    let username: String
    let password: String
}

// MARK: - RequestParams Extension
extension SyncDataRequest: RequestParams {
    func encode() -> String? {
        return nil
    }
}

// MARK: - ApiEndpoint Extension
extension SyncDataRequest: ApiEndpoint {
    func endpoint() -> String {
        return "/sync"
    }
    func dispatch(
        onSuccess sucessHandler: @escaping (SingleResponse<SyncDataResponse>?) -> Void,
        onFailure failureHandler: @escaping (ApiRequest.ApiError) -> Void
    ) {
        ApiRequest.shared.post(request: self, onSuccess: sucessHandler, onFailure: failureHandler)
    }
}
