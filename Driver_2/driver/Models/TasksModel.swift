//
//  TasksModel.swift
//  driver
//
//  Created by Ammar Ahmed on 02/09/1445 AH.
//

import Foundation

struct TaskModel:Codable,Hashable,Identifiable{
    var id:String
    var title:String
    var taskDescription:String
    var createdAt:String
    var isCompleted:Bool
    
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title,taskDescription
        case createdAt
        case isCompleted
    }
}


struct Category:Codable,Identifiable{
    var id:String
    var title:String
    var tasks:[TaskModel]
}

struct NewCategoryResponse:Codable,Identifiable{
        var title: String
        var tasks: [TaskModel]
        var id: String
        
        enum CodingKeys: String, CodingKey {
            case title, tasks
            case id = "_id"
        }
    
}

extension Category{
    static var example:Category = Category(id: "1", title: "test", tasks: [])
}
