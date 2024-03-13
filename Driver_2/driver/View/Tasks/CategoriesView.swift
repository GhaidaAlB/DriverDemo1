//
//  TasksView.swift
//  driver
//
//  Created by Ammar Ahmed on 03/09/1445 AH.
//

import SwiftUI

struct CategoriesView: View {
    @State private var addCategory:Bool = false
    @State private var addTask:Bool = false
    @StateObject private var taskApi = TasksViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                Form{
                    Section("Categories"){
                        ForEach(taskApi.categoies){category in
                            NavigationLink{
                                CategoryView(category: category)
                                    .navigationTitle(category.title)
                                    .navigationBarTitleDisplayMode(.inline)
                            }label: {
                                HStack(){
                                    Text(category.title)
                                        .font(.subheadline)
                                        .foregroundStyle(.primary)
                                    Spacer()
                                    Text("\(category.tasks.count)")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                            }
                            
                        }
                    }
                }
                
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        Button{
                            addCategory.toggle()
                        }label: {
                            Text("Category")
                                Image(systemName: "plus")
                        }
                    }

                }
                .sheet(isPresented: $addCategory,onDismiss: fetchCategories){
                    CreateCategoryView()
                    
                }
                
            }
            .navigationTitle("Tasks")
            .navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.automatic/*@END_MENU_TOKEN@*/)
            .onAppear{
                fetchCategories()
            }
        }
        
    }
    
    private func fetchCategories() {
          Task {
              await taskApi.getCategoies()
          }
      }
    
}

#Preview {
    CategoriesView()
}
