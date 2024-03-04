//
//  TasksData.swift
//  DriverDemo
//
//  Created by Ammar Ahmed on 22/08/1445 AH.
//

import SwiftData
import SwiftUI

@Model
class Tasks:Identifiable{
   
    var id = UUID()
    var title:String
    var taskDescription:String
    var list:[String]
    
    init(id: UUID = UUID(), title: String, description: String, list: [String]) {
        self.id = id
        self.title = title
        self.taskDescription = description
        self.list = list
    }
}

