//
//  APIClient.swift
//  driver
//
//  Created by Ammar Ahmed on 02/09/1445 AH.
//

import Foundation

enum HTTPMethod: String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case delete  = "DELETE"
}

enum NetworkRequestError: LocalizedError, Equatable {
    case invalidRequest
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case error4xx(_ code: Int)
    case serverError
    case error5xx(_ code: Int)
    case decodingError( _ description: String)
    case urlSessionFailed(_ error: URLError)
    case timeOut
    case unknownError
}

// Extending Encodable to Serialize a Type into a Dictionary
extension Encodable {
    var asDictionary: [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else { return [:] }

        guard let dictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            return [:]
        }
        return dictionary
    }
}

// Our Request Protocol
protocol Request {
    var path: String { get }
    var method: HTTPMethod { get }
    var contentType: String { get }
    var body: [String: Any]? { get }
    var queryParams: [String: Any]? { get }
    var headers: [String: String]? { get }
    associatedtype ReturnType: Codable
}

// Defaults and Helper Methods
extension Request {
    
    // Defaults
    var method: HTTPMethod { return .get }
    var contentType: String { return "application/json" }
    var queryParams: [String: Any]? { return nil }
    var body: [String: Any]? { return nil }
    var headers: [String: String]? { return nil }
    

    private func requestBodyFrom(params: [String: Any]?) -> Data? {
        guard let params = params else { return nil }
        guard let httpBody = try? JSONSerialization.data(withJSONObject: params, options: []) else {
            return nil
        }
        return httpBody
    }
    
    func addQueryItems(queryParams: [String: Any]?) -> [URLQueryItem]? {
        guard let queryParams = queryParams else {
            return nil
        }
        return queryParams.map({URLQueryItem(name: $0.key, value: "\($0.value)")})
    }
   
    func asURLRequest(baseURL: String) -> URLRequest? {
        guard var urlComponents = URLComponents(string: baseURL) else { return nil }
        urlComponents.path = "\(urlComponents.path)\(path)"
        urlComponents.queryItems = addQueryItems(queryParams: queryParams)
        guard let finalURL = urlComponents.url else { return nil }
        var request = URLRequest(url: finalURL)
        request.httpMethod = method.rawValue
        request.httpBody = requestBodyFrom(params: body)
        request.allHTTPHeaderFields = headers
        
 
        request.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
      
        return request
    }
}

struct NetworkDispatcher {
    
    let urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func dispatch<ReturnType: Codable>(request: URLRequest) async throws -> ReturnType {
        print("[\(request.httpMethod?.uppercased() ?? "")] '\(request.url!)'")
        
        let (data, response) = try await urlSession.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkRequestError.unknownError
        }
        
        print("[\(httpResponse.statusCode)] '\(request.url!)'")
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw httpError(httpResponse.statusCode)
        }
        
       
        do {
            let decodedData = try JSONDecoder().decode(ReturnType.self, from: data)
            return decodedData
        } catch {
            print(error)
            throw NetworkRequestError.decodingError(error.localizedDescription)
        }
    }
    
    private func httpError(_ statusCode: Int) -> NetworkRequestError {
        switch statusCode {
             case 400: return .badRequest
             case 401: return .unauthorized
             case 403: return .forbidden
             case 404: return .notFound
             case 402, 405...499: return .error4xx(statusCode)
             case 500: return .serverError
             case 501...599: return .error5xx(statusCode)
             default: return .unknownError
             }
    }
    
    private func handleError(_ error: Error) -> NetworkRequestError {
           switch error {
           case is Swift.DecodingError:
               return .decodingError(error.localizedDescription)
           case let urlError as URLError:
               return .urlSessionFailed(urlError)
           case let error as NetworkRequestError:
               return error
           default:
               return .unknownError
           }
       }
}

struct APIClient {
    
    static var networkDispatcher: NetworkDispatcher = NetworkDispatcher()
    
    static func dispatch<R: Request>(_ request: R) async throws -> R.ReturnType {
        guard let urlRequest = request.asURLRequest(baseURL: APIConstants.basedURL) else {
            throw NetworkRequestError.badRequest
        }
        
        do {
            let response: R.ReturnType = try await networkDispatcher.dispatch(request: urlRequest)
            return response
        } catch {
            throw error
        }
    }
}

