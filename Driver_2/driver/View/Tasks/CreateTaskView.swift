//
//  CreateTaskView.swift
//  driver
//
//  Created by Ammar Ahmed on 04/09/1445 AH.
//

import SwiftUI

struct CreateTaskView: View {
    @Environment(\.dismiss) var dismiss
    var categoryId:String
    @State private var taskTitle:String = ""
    @State private var taskDescription:String = ""
    @StateObject var taskApi = TasksViewModel()
    
    var body: some View {
        NavigationStack{
            Form{
                Section("Generate Task"){
                    TextField("task title ", text: $taskTitle)
                    TextField("task description",text: $taskDescription)
                }
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button("dismiss"){
                        dismiss()
                    }
                }
                
                ToolbarItem(placement:.topBarTrailing){
                    Button("Add"){
                        Task{
                            await taskApi.addTask(title: taskTitle, taskDescription: taskDescription, categoryId: categoryId)
                            dismiss()
                            
                        }
                        
                        
                        
                    }
                    .disabled(taskTitle.isEmpty)
                }
            }
            .navigationTitle("Create Task")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CreateTaskView(categoryId: "1")
}
