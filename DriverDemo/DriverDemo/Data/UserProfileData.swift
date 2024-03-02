//
//  UserProfileData.swift
//  DriverDemo
//
//  Created by Ammar Ahmed on 21/08/1445 AH.
//

import Foundation
import SwiftUI


struct UserProfileData:Identifiable{
    
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
    
    
    static var example = UserProfileData(firstName: "Ava", lastName: "Thompsom", email: "ava.thompso@redseaglobal.com ", telephone: "009665123456789", position: "Developer - Smart Services Projects", lineMangeName: "Ehab", isSinup: false, userCurrentLocation: "")
}
