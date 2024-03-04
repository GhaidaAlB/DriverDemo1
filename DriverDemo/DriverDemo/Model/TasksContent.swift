//
//  TasksContent.swift
//  DriverDemo
//
//  Created by Ammar Ahmed on 22/08/1445 AH.
//
import SwiftUI
import SwiftData


    @Model
    class Category {
        @Attribute(.unique) var title:String
        
//        @Relationship() var tasks:[Task]?
        init(title: String) {
            self.title = title
            
        }
    }
    
    @Model
    class Task{
        var id = UUID()
        var title:String
        var taskDescription:String
        var createdAt:Date
        
//        @Relationship() var category:Category
      
        init(id: UUID = UUID(), title: String, taskDescription: String, createdAt: Date) {
            self.id = id
            self.title = title
            self.taskDescription = taskDescription
            self.createdAt = createdAt
        }
    }
    

