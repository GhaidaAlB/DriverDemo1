//
//  Task.swift
//  DriverDemo
//
//  Created by Ammar Ahmed on 23/08/1445 AH.
//

import Foundation

 struct Task{
    var title:String
    var taskDescription:String
    var createdAt:Date
    var isCompleted:Bool
    
}

extension Task{
    
    static var dummy:Task{
        .init(title: "Dummy ",
              taskDescription: "Dummy Description",
              createdAt: .now,
              isCompleted: false)
    }
}
