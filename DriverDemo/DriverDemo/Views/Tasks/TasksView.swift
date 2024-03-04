//
//  TasksView.swift
//  DriverDemo
//
//  Created by Ammar Ahmed on 22/08/1445 AH.
//
import SwiftData
import SwiftUI

struct TasksView: View {
    @Query var allCategory: [Category]
    @Query var allTasks:[Tasks]
    @State private var addCategory:Bool = false
    @State private var addTask:Bool = false
    @State private var newTask:Task?
    @State private var newCategoryName:String = ""
    

    var body: some View {
        NavigationStack{
            VStack{
                Form{
                    
                    Section{
                        if allCategory.isEmpty{
                            ContentUnavailableView{
                                Image(systemName: "doc.badge.plus")
                                    .font(.largeTitle)
                                    .foregroundStyle(.black.opacity(0.6))
                                
                            }description: {
                                Text("no category created")
                            }actions: {
                                Button("Add Catogory"){
                                    addCategory.toggle()
                                }
                                .buttonStyle(.borderedProminent)
                            }
                            
                        }else{
                            List(allCategory){category in
                                HStack{
                                    Text(category.categoryName)
                                    Spacer()
//                                    Text("\(category.tasks?.count ?? 0)")
                                }
                            }
                        }
                        
                    }header: {
                        Text("Categories")
                            .bold()
                            .font(.title3)
                    }
                    
                }
                
                .toolbar{
                    ToolbarItem(placement: .bottomBar){
                        Button("add Category"){
                            addCategory.toggle()
                        }
                    }

                    ToolbarItem(placement: .bottomBar){
                        Button("add task"){
                            addTask.toggle()
                        }
                    }
                }
                .sheet(isPresented: $addCategory){
                    CreateCategoryView()
                    
                }
                
            }
            .navigationTitle("Tasks")
            .navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.automatic/*@END_MENU_TOKEN@*/)
        }
        
    }
        
    
}

#Preview {
    TasksView()
}

