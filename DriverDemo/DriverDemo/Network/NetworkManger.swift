//
//  NetworkManger.swift
//  DriverDemo
//
//  Created by Ammar Ahmed on 25/08/1445 AH.
//

import Foundation

class NetworkManager {

    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request<T: Decodable>(from endpoint: EndpointEnum, params: Params? = nil) async throws -> T {
        guard var urlComponents = URLComponents(url: endpoint.url, resolvingAgainstBaseURL: false) else {
            throw NetworkError.invalidURL
        }
        
        if !endpoint.isJsonEncoded, let params = params {
            urlComponents.queryItems = params.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        }
        
        guard let url = urlComponents.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.httpMethod.rawValue
        
        if endpoint.isJsonEncoded, let params = params {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
            } catch {
                throw NetworkError.encodingFailed
            }
        }
        
        endpoint.header.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            throw NetworkError.statusCode
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingError
        }
    }
}

// Adding a new case for decoding errors
enum NetworkError: Error {
    case invalidURL
    case encodingFailed
    case statusCode
    case decodingError // New case for decoding errors
}
