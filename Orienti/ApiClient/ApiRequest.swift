//
//  ApiRequest.swift
//  Orienti
//
//  Created by Kryštof Kiss on 26/09/2021.
//

import Foundation

class ApiRequest {
    
    static let shared = ApiRequest()
    
    enum ApiError: Error {
        case parseError
        case noUrlResponseObject
        case contentExpected
        case unhandledValidation
        case invalidEndpoint
        case fatal(ErrorResponse<String>)
        case conflict(ErrorResponse<String>)
        case unauthorized(ErrorResponse<String>)
        case validationError(ErrorResponse<[ValidationErrorResponse]>)
    }
    
    private enum HttpMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case patch = "PATCH"
        case delete = "DELETE"
    }
    
    private func urlRequest(from request: ApiEndpoint, urlParams: [String:String]?, httpMethod: HttpMethod) -> URLRequest? {
        var endpoint = request.endpoint()
        
        if let urlParams = urlParams {
            for param in urlParams {
                endpoint = endpoint.replacingOccurrences(of: param.key, with: param.value)
            }
        }
        
        guard let url: URL = URL(string: "\(Configuration.apiUrl)\(endpoint)") else {
            return nil
        }
        
        var endpointRequest = URLRequest(url: url)
        
        // Basic HTTP headers
        endpointRequest.httpMethod = httpMethod.rawValue
        endpointRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        return endpointRequest
    }
    
    // MARK: Authorization generator
    private func generateAuthorization(requestBody: String, requestEndpoint: String) -> String {
        return ""
    }
    
    private func processResult<T: Decodable>(result: Result<T, ApiRequest.ApiError>, onSuccess: (_: T) -> Void, onFailure: (_: ApiRequest.ApiError) -> Void) {
        switch result {
        case .success(let data):
            onSuccess(data)
        case .failure(let error):
            onFailure(error)
        }
    }
    
    // MARK: - HTTP methods
    func get<R: ApiEndpoint & RequestParams, T: Decodable>(
        request: R,
        urlParams: [String:String]? = nil,
        onSuccess sucessHandler: @escaping (T?) -> Void,
        onFailure failureHandler: @escaping (ApiRequest.ApiError) -> Void
    ) {
        guard var endpointRequest = urlRequest(from: request, urlParams: urlParams, httpMethod: .get) else {
            failureHandler(.invalidEndpoint)
            return
        }
        
        if let queryParams = request.encode() {
            endpointRequest.url = endpointRequest.url.flatMap{ URL(string: $0.absoluteString + "?\(queryParams)")}
        }
        
        endpointRequest.addValue(
            generateAuthorization(
                requestBody: "",
                requestEndpoint: endpointRequest.url?.relativePathWithQuery ?? ""
            ),
            forHTTPHeaderField: "Authorization"
        )
        
        URLSession.shared.jsonDecodableTask(with: endpointRequest) { result in
            DispatchQueue.main.async {
                self.processResult(result: result, onSuccess: sucessHandler, onFailure: failureHandler)
            }
        }.resume()
    }
    
    func post<R: ApiEndpoint & Encodable, T: Decodable>(
        request: R,
        urlParams: [String:String]? = nil,
        onSuccess sucessHandler: @escaping (T?) -> Void,
        onFailure failureHandler: @escaping (ApiRequest.ApiError) -> Void
    ) {
        guard var endpointRequest = urlRequest(from: request, urlParams: urlParams, httpMethod: .post) else {
            failureHandler(.invalidEndpoint)
            return
        }
        
        do {
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .iso8601
            let payload = try encoder.encode(request)
            endpointRequest.httpBody = payload
        } catch {
            failureHandler(.parseError)
            return
        }
        
        endpointRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        endpointRequest.addValue(
            generateAuthorization(
                requestBody: String(bytes: endpointRequest.httpBody!, encoding: .utf8)!,
                requestEndpoint: endpointRequest.url?.relativePath ?? ""
            ),
            forHTTPHeaderField: "Authorization"
        )
        
        URLSession.shared.jsonDecodableTask(with: endpointRequest) { result in
            DispatchQueue.main.async {
                self.processResult(result: result, onSuccess: sucessHandler, onFailure: failureHandler)
            }
        }.resume()
    }
    
    func put<R: ApiEndpoint & Encodable, T: Decodable>(
        request: R,
        urlParams: [String:String]? = nil,
        onSuccess sucessHandler: @escaping (T?) -> Void,
        onFailure failureHandler: @escaping (ApiRequest.ApiError) -> Void
    ) {
        guard var endpointRequest = urlRequest(from: request, urlParams: urlParams, httpMethod: .post) else {
            failureHandler(.invalidEndpoint)
            return
        }
        
        do {
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .iso8601
            let payload = try encoder.encode(request)
            endpointRequest.httpBody = payload
        } catch {
            failureHandler(.parseError)
            return
        }
        
        endpointRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        endpointRequest.addValue(
            generateAuthorization(
                requestBody: String(bytes: endpointRequest.httpBody!, encoding: .utf8)!,
                requestEndpoint: endpointRequest.url?.relativePath ?? ""
            ),
            forHTTPHeaderField: "Authorization"
        )
        
        URLSession.shared.jsonDecodableTask(with: endpointRequest) { result in
            DispatchQueue.main.async {
                self.processResult(result: result, onSuccess: sucessHandler, onFailure: failureHandler)
            }
        }.resume()
    }
    
    func patch<R: ApiEndpoint & Encodable, T: Decodable>(
        request: R,
        urlParams: [String:String]? = nil,
        onSuccess sucessHandler: @escaping (T?) -> Void,
        onFailure failureHandler: @escaping (ApiRequest.ApiError) -> Void
    ) {
        guard var endpointRequest = urlRequest(from: request, urlParams: urlParams, httpMethod: .patch) else {
            failureHandler(.invalidEndpoint)
            return
        }
        
        do {
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .iso8601
            let payload = try encoder.encode(request)
            endpointRequest.httpBody = payload
        } catch {
            failureHandler(.parseError)
            return
        }
        
        endpointRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        endpointRequest.addValue(
            generateAuthorization(
                requestBody: String(bytes: endpointRequest.httpBody!, encoding: .utf8)!,
                requestEndpoint: endpointRequest.url?.relativePath ?? ""
            ),
            forHTTPHeaderField: "Authorization"
        )
        
        URLSession.shared.jsonDecodableTask(with: endpointRequest) { result in
            DispatchQueue.main.async {
                self.processResult(result: result, onSuccess: sucessHandler, onFailure: failureHandler)
            }
        }.resume()
    }
    
    func delete<R: ApiEndpoint & RequestParams, T: Codable>(
        request: R,
        urlParams: [String:String]? = nil,
        onSuccess sucessHandler: @escaping (T?) -> Void,
        onFailure failureHandler: @escaping (ApiRequest.ApiError) -> Void
    ) {
        guard var endpointRequest = urlRequest(from: request, urlParams: urlParams, httpMethod: .delete) else {
            failureHandler(.invalidEndpoint)
            return
        }
        
        if let queryParams = request.encode() {
            endpointRequest.url = endpointRequest.url.flatMap{ URL(string: $0.absoluteString + "?\(queryParams)")}
        }
        
        endpointRequest.addValue(
            generateAuthorization(
                requestBody: "",
                requestEndpoint: endpointRequest.url?.relativePathWithQuery ?? ""
            ),
            forHTTPHeaderField: "Authorization"
        )
        
        URLSession.shared.jsonDecodableTask(with: endpointRequest) { result in
            DispatchQueue.main.async {
                self.processResult(result: result, onSuccess: sucessHandler, onFailure: failureHandler)
            }
        }.resume()
    }
}
