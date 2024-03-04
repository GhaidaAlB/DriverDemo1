//
//  CreateCategoryView.swift
//  DriverDemo
//
//  Created by Ammar Ahmed on 23/08/1445 AH.
//

import SwiftUI

struct CreateCategoryView: View {
    @Environment(\.dismiss) var dismiss
    @State private var title:String = ""
    @State private var des = ""
    @Environment(\.modelContext) var context
    
    var body: some View {
        NavigationStack{
            Form{
                Section("Generate Category"){
                    TextField("title of the category",text: $title)
                    TextField("description of the category",text: $des)
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
                        context.insert(Category(categoryName: title))
                        try?context.save()
                        
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
