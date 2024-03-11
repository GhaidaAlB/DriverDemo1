//
//  TaskData.swift
//  DriverDemo
//
//  Created by Ammar Ahmed on 25/08/1445 AH.
//

import Foundation

@MainActor
class CatoegoriesNetworkManger: ObservableObject {
    
    @Published var allCategories:[Category]?
    @Published var isLoading:Bool = false
    @Published var error:String?
    
    var networkManger = NetworkManager()
    
    func fetchAllCategorues()async{
        isLoading = true
        
        do{
            let response:[Category] = try await networkManger.request(from: .listCategories)
            
            allCategories = response
            
            print(response)
        }catch{
            
            self.error = error.localizedDescription
        }
        isLoading = false
    }
    
    func createNewCategory(params:Params)async{
        isLoading = true
        
        do{
            let response:Category = try await networkManger.request(from: .createCategory, params: params)
            
            await fetchAllCategorues()
        }catch{
            self.error = error.localizedDescription
        }
        isLoading = false
    }
    
    func addTaskToCategory(by categoryId:String, params:Params)async{
        
        isLoading = true
        
        do{
            let response:TaskValue = try await networkManger.request(from: .createTask,params: params)
            await fetchAllCategorues()
            
        }catch{
            self.error = error.localizedDescription
        }
        isLoading = false
        
    }
}
