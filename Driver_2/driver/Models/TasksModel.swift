//
//  TasksModel.swift
//  driver
//
//  Created by Ammar Ahmed on 02/09/1445 AH.
//

import Foundation

struct TaskModel:Codable,Hashable{
    var id:String
    var title:String
    var taskDescription:String
    var createdAt:Date
    var isCompleted:Bool
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title,taskDescription
        case createdAt
        case isCompleted
    }
}


struct Category:Codable{
    var id:String
    var title:String
    var tasks:[TaskModel]
}
