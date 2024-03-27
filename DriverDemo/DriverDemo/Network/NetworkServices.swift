//
//  endpoints.swift
//  DriverDemo
//
//  Created by Ammar Ahmed on 25/08/1445 AH.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidRequestBody
}

protocol Request{
    var url:URL { get }
    var httpMethod:HTTPMethods { get }
    var isJsonEncoded:Bool { get }
    var header:[String:String] { get }
    var query:[URLQueryItem]? { get }
    var body: [String: Any]? { get }
}

enum EndpointEnum{
    case createCategory
    case listCategories
    case updateCategory
    case deleteCategory
    case createTask
}

enum HTTPMethods:String {
    case GET = "GET"
    case PUT = "PUT"
    case POST = "POST"
    case DELETE = "DELETE"
}

typealias Params=[String:Any]

class EndPoint{
    let baseURL = "http://localhost:3003"
    var requestURL:URL
    
    required init(with URI:String){
        let urlString = baseURL + URI
        
        guard let url = URL(string:urlString) else {
            fatalError("invalid error")
        }
         requestURL = url
    }
}

extension EndpointEnum:Request {
    var query: [URLQueryItem]? {
        <#code#>
    }
    
    var body: [String : Any]? {
        <#code#>
    }
    
    var header: [String : String] {
        switch self{
        case .createCategory,.createTask,.deleteCategory,.updateCategory:
            return ["Accept":"application/json"]
        case .listCategories:
            return ["Content-Type":"application/json"]
        }
    }
    
    var url: URL {
      let baseURL = "https://localhost:3003"
        
        switch self {
        case .createCategory,.deleteCategory,.listCategories,.updateCategory:
            return EndPoint(with: "/categories").requestURL
        case .createTask:
            return EndPoint(with: "/categories/tasks").requestURL
  
        }
    }
    
    var httpMethod: HTTPMethods {
        switch self {
        case .createTask,.createCategory:
            return .POST
        case .listCategories:
            return .GET
        case .updateCategory:
            return .PUT
        case .deleteCategory:
            return .DELETE
        }
    }
    
    
    var contentType:String {return "application/json"}
    
    var isJsonEncoded:Bool{
        switch self{
        case .createCategory,.createTask,.deleteCategory,.updateCategory:
            return true
        case .listCategories:
            return false
        }
    }
    
}
