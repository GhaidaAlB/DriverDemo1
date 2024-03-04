//
//  Categories.swift
//  DriverDemo
//
//  Created by Ammar Ahmed on 23/08/1445 AH.
//

import SwiftUI

struct Categories: View {
    @Binding var allCategory:[Category]
    
    
    var body: some View {
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
                        Text(category.title)
                        Spacer()
                        Text("\(category.tasks?.count ?? 0)")
                    }
                }
            }
            
        }header: {
            Text("Categories")
                .bold()
                .font(.title3)
        }    }
}

#Preview {
    let category = [Category]()
    Categories(allCategory:category)
}
