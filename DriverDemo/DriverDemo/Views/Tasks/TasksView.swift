//
//  TasksView.swift
//  DriverDemo
//
//  Created by Ammar Ahmed on 22/08/1445 AH.
//
import SwiftUI

struct TasksView: View {
    @State private var addCategory:Bool = false
    @State private var addTask:Bool = false
    @State private var newTask:Tasks?
    @StateObject private var categoryNetworkManger = CatoegoriesNetworkManger()
    
    
    

    var body: some View {
        NavigationStack{
            VStack{
                Form{
                    
                
                    
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
            .onAppear{
                Task{
                  await  categoryNetworkManger.fetchAllCategorues()
                }
            }
        }
        
    }
        
    
}

#Preview {
    TasksView()
}

