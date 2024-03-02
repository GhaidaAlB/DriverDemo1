//
//  UserProfileData.swift
//  DriverDemo
//
//  Created by Ammar Ahmed on 21/08/1445 AH.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class UserProfileData:Identifiable{
    
    var id = UUID()
     var firstName:String
    var lastName:String
    var email:String
    var telephone:String
    var position:String
    var lineMangeName:String
    
    var isSinup:Bool
    var userCurrentLocation:String
    
    var fullName:String{
        "\(firstName) \(lastName)"
    }
    
    var image:String{
        fullName.replacingOccurrences(of: " ", with: "")
    }
    
    init(id: UUID = UUID(), firstName: String, lastName: String, email: String, telephone: String, position: String, lineMangeName: String, isSinup: Bool, userCurrentLocation: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.telephone = telephone
        self.position = position
        self.lineMangeName = lineMangeName
        self.isSinup = isSinup
        self.userCurrentLocation = userCurrentLocation
    }
    
    static var example = UserProfileData(firstName: "Ava", lastName: "Thompsom", email: "ava.thompso@redseaglobal.com ", telephone: "009665123456789", position: "Developer - Smart Services Projects", lineMangeName: "Ehab", isSinup: false, userCurrentLocation: "")
}
