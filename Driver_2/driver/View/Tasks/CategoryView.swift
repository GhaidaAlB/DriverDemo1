//
//  CategoryView.swift
//  driver
//
//  Created by Ammar Ahmed on 03/09/1445 AH.
//

import SwiftUI

struct CategoryView: View {
    var category:Category
    @State private var addTask:Bool = false
    @StateObject private var taskApi = TasksViewModel()
    
    var body: some View {
        VStack{
            Form{
                Section("Tasks"){
                    if !category.tasks.isEmpty{
                        ForEach(category.tasks){task in
                            HStack{
                                VStack(alignment:.leading){
                                    Text(task.title)
                                        .bold()
                                        .font(.title2)
                                    
                                    Text(task.taskDescription)
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                                Spacer()
                                
                                VStack{
                                    Text("\(task.isCompleted ? "Completed":"Not Completed")")
                                        .font(.caption)
                                        .foregroundStyle(.primary)
                                }
                                .padding([.horizontal],10)
                                    .foregroundStyle(.black)
                                    .padding([.vertical],4)
                                    .background(task.isCompleted ? Color.secondary : .successLight)
                                    .cornerRadius(7)

                            }
                            .padding(.horizontal)
                            
                        }
                    }else{
                        ContentUnavailableView {
                            Label("No Task Available", systemImage: "text.badge.checkmark")
                        } description: {
                            Text("Add new tasks .")
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
        .toolbar{
            ToolbarItem(placement: .topBarTrailing){
                Button{
                    addTask.toggle()
                }label: {
                    HStack{
                        Text("Task")
                        Image(systemName: "plus")
                    }
                }
             
            }
        }
        .sheet(isPresented: $addTask,onDismiss:fetchCategories ){
            CreateTaskView(categoryId:category.id)
        }
        .onAppear{
            taskApi.getCategory(by: category.title)
        }
    }
    
    private func fetchCategories() {
          Task {
              await taskApi.getCategoies()
             
          }
      }
}

#Preview {
    CategoryView(category: Category.example)
}
