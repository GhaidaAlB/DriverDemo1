//
//  TasksModel.swift
//  driver
//
//  Created by Ammar Ahmed on 02/09/1445 AH.
//

import Foundation

struct TaskModel:Codable,Hashable{
    var title:String
    var taskDescription:String
    var createdAt:Date
    var isCompleted:Bool
}


struct Category:Codable{
    var title:String
    var tasks:[TaskModel]
}
