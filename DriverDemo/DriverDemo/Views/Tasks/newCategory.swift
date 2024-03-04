//
//  newCategory.swift
//  DriverDemo
//
//  Created by Ammar Ahmed on 23/08/1445 AH.
//

import SwiftUI

struct newCategory: View {
    @State private var newCategoryName:String = ""
    @Binding private var onSaveCategory:()->Void
    var body: some View {
        Form{
            TextField("category name", text:$newCategoryName)
        }
    }
}

#Preview {
    newCategory()
}
