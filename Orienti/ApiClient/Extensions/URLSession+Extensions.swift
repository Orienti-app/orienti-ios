//
//  URLSession+Extensions.swift
//  Orienti
//
//  Created by Kryštof Kiss on 26/09/2021.
//

import Foundation

extension URLSession {
    func jsonDecodableTask<T: Decodable>(
        with request: URLRequest,
        completionHandler handler: @escaping (Result<T?, ApiRequest.ApiError>) -> Void
    ) -> URLSessionDataTask {
        dataTask(with: request) { dataOrNil, urlResponseOrNil, errorOrNil in
            if let response = urlResponseOrNil as? HTTPURLResponse {
                if let data = dataOrNil {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    
                    do {
                        // Successful response with payload
                        if response.statusCode == 204 {
                            handler(.success(nil))
                        } else if response.statusCode >= 200 && response.statusCode < 300 {
                            let decodedResponse = try decoder.decode(T.self, from: data)
                            handler(.success(decodedResponse))
                        }
                        // Unauthorized
                        else if (response.statusCode == 401) {
                            let decodedResponse = try decoder.decode(ErrorResponse<String>.self, from: data)
                            handler(.failure(.unauthorized(decodedResponse)))
                        }
                        // Validation error
                        else if (response.statusCode == 422) {
                            let decodedResponse = try decoder.decode(ErrorResponse<[ValidationErrorResponse]>.self, from: data)
                            handler(.failure(.validationError(decodedResponse)))
                        }
                        // Conflict
                        else if (response.statusCode == 409) {
                            let decodedResponse = try decoder.decode(ErrorResponse<String>.self, from: data)
                            handler(.failure(.conflict(decodedResponse)))
                        }
                        // Generic error
                        else {
                            let decodedResponse = try decoder.decode(ErrorResponse<String>.self, from: data)
                            handler(.failure(.fatal(decodedResponse)))
                        }
                    } catch let decodingError {
                        // If decoder failed
                        print(decodingError as! DecodingError)
                        handler(.failure(.parseError))
                    }
                    
                } else {
                    // If there is no content and status code 204 everything is OK
                    if (response.statusCode == 204) {
                        handler(.success(nil))
                    }
                    // If there is no content and another status code, probably we have a problem Huston
                    else {
                        handler(.failure(.contentExpected))
                    }
                }
            } else {
                handler(.failure(.noUrlResponseObject))
            }
        }
    }
}
