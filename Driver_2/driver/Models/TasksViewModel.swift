//
//  TasksViewModel.swift
//  driver
//
//  Created by Ammar Ahmed on 02/09/1445 AH.
//

import Foundation

class TasksViewModel:ObservableObject{
    
    @Published var categoies:[Category] = []
    @Published var selectedCategoy:Category?
    @Published var isLoading:Bool = false
    
    func getCategoies()async{
        
        isLoading = true
        do{
            let response = try await APIClient.dispatch(APIRoutes.GetCategories())
            self.categoies = response
        }catch{
            print(error.localizedDescription)
        }
        
        isLoading = false
    }
    func getCategory(by title:String) {
      let filterdList =  categoies.filter{
            $0.title == title
        }
        
        self.selectedCategoy = filterdList.first
    }
    
    func addCategoy(title:String)async{
        isLoading = true
        do{
            try await APIClient.dispatch(APIRoutes.AddCategory(body: APIParameters.categoiesParam(title: title)))
            await getCategoies()
        }catch{
            print(error.localizedDescription)
        }
        isLoading = false
    }
    
    func addTask(title:String,taskDescription:String,categoryId:String)async{
        isLoading = true
        do{
            try await APIClient.dispatch(APIRoutes
                .addTask(body: APIParameters
                    .addTaskParam(title: title,
                                  taskDescription: taskDescription,
                                  categoryId:categoryId)))
            await getCategoies()
        }catch{
            print(error.localizedDescription)
        }
        isLoading = false
    }
    
}
