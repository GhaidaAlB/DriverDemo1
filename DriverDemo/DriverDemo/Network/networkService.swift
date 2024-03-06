//
//  networkService.swift
//  DriverDemo
//
//  Created by Ammar Ahmed on 25/08/1445 AH.
//

import Foundation


struct NetworkService {
    
    func performRequest<T: Decodable>(for endpoint: APIEndpoint) async throws -> T {
        guard let request = endpoint.request else {
            throw APIError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, 200...299 contains httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }
        
        do {
            let decodedResponse = try JSONDecoder().decode(T.self, from: data)
            return decodedResponse
        } catch {
            throw error
        }
    }
}
