//
//  taskViewModal.swift
//  DriverDemo
//
//  Created by Ammar Ahmed on 23/08/1445 AH.
//


import Foundation
import SwiftData // Assuming SwiftData handles your data layer

class TasksViewModel: ObservableObject {
    @Published var addCategory: Bool = false
    @Published var newCategoryName: String = ""

    
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        fetchCategories()
    }

    func fetchCategories() {
        
    }

    func toggleAddCategory() {
        addCategory.toggle()
    }

    func saveCategory() {
        let newCategory = Category(title: newCategoryName)
        modelContext.insert(newCategory)
        do {
            try modelContext.save()
            addCategory = false
            fetchCategories() // Refresh categories
        } catch {
            print("Error adding category") // Handle error appropriately
        }
    }
}
