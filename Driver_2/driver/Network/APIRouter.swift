//
//  APIRoutes.swift
//  driver
//
//  Created by Ammar Ahmed on 02/09/1445 AH.
//

import Foundation

class APIRoutes{
    
    struct GetCategories:Request{
        typealias ReturnType = [Category]
        var path: String = "/categories"
        var method: HTTPMethod = .get
    }
    
    struct GetCategory:Request{
        typealias ReturnType = [Category]
        var path: String = "/categories"
        var method: HTTPMethod = .get
        var queryParams: [String : Any]?
        init(queryParams: APIParameters.categoiesParam) {
                self.queryParams = queryParams.asDictionary
            }
    }
    
    struct AddCategory:Request {
        typealias ReturnType = NewCategoryResponse
        var path: String = "/categories"
        var method: HTTPMethod = .post
        var body: [String : Any]?
        init(body:APIParameters.categoiesParam){
            self.body = body.asDictionary
        }
    }
    
    struct addTask:Request{
        typealias ReturnType = TaskModel
        var path: String = "/categories/tasks"
        var method: HTTPMethod = .post
        var body: [String : Any]?
        init(body:APIParameters.addTaskParam){
            self.body = body.asDictionary
        }
    }
}

