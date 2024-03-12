//
//  APIParameters.swift
//  driver
//
//  Created by Ammar Ahmed on 02/09/1445 AH.
//

import Foundation

protocol DictionaryConvertor: Codable {}

struct APIParameters {
    
    struct categoiesParam:Encodable{
        var title:String?
    }
    
    struct addTaskParam:Encodable{
        var title:String
        var taskDescription:String?
        var categoryId:String
    }
    
}
