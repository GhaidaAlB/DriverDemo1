//
//  Category.swift
//  DriverDemo
//
//  Created by Ammar Ahmed on 23/08/1445 AH.
//

import SwiftUI
import SwiftData

@Model
 class Category {
    @Attribute(.unique) var categoryName:String
    
     var tasks:[Tasks]?

    init(categoryName: String) {
        self.categoryName = categoryName
    }
}

