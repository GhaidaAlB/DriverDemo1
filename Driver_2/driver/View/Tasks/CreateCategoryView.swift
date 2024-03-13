//
//  CreateCategoryView.swift
//  driver
//
//  Created by Ammar Ahmed on 03/09/1445 AH.
//

import SwiftUI

struct CreateCategoryView: View {
    @Environment(\.dismiss) var dismiss
    @State private var title:String = ""
    @State private var des = ""
    @StateObject private var taskApi = TasksViewModel()

    
    var body: some View {
        NavigationStack{
            Form{
                Section("Generate Category"){
                    TextField("title of the category",text: $title)
                }
            }
            .navigationTitle("Create Category")
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button("dismiss"){
                        dismiss()
                    }
                }
                
                ToolbarItem(placement:.topBarTrailing){
                    Button("Add"){
                        Task{
                         await taskApi.addCategoy(title:title)
                            dismiss()
                   
                        }
                       
                        
                        
                    }
                    .disabled(title.isEmpty)
                }
            }
        }
       
    }
}

#Preview {
    CreateCategoryView()
}
