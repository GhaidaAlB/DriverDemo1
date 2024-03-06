//
//  Task.swift
//  DriverDemo
//
//  Created by Ammar Ahmed on 23/08/1445 AH.
//

import Foundation

struct TaskValue:Decodable{
    var title:String
    var taskDescription:String
    var createdAt:Date
    var isCompleted:Bool
    
}
