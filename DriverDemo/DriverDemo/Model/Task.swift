//
//  Task.swift
//  DriverDemo
//
//  Created by Ammar Ahmed on 23/08/1445 AH.
//

import Foundation
import SwiftData

@Model
 class Task{
    var title:String
    var taskDescription:String
    var createdAt:Date
    var isCompleted:Bool
    
//     @Relationship(deleteRule:.nullify) var category:[Category]?
    
    init(title: String, taskDescription: String, createdAt: Date, isCompleted: Bool) {
        self.title = title
        self.taskDescription = taskDescription
        self.createdAt = createdAt
        self.isCompleted = isCompleted
    }
}

extension Task{
    
    static var dummy:Task{
        .init(title: "Dummy ",
              taskDescription: "Dummy Description",
              createdAt: .now,
              isCompleted: false)
    }
}
