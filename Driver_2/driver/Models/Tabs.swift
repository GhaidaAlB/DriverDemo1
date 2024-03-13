//
//  Tabs.swift
//  driver
//
//  Created by Ammar Ahmed on 03/09/1445 AH.
//

import Foundation

enum Tabs:Hashable,CaseIterable {
    case summary
    case tasks
    
    var tabTitle:String{
        switch self{
        case .summary: return "Summary"
        case .tasks: return "Tasks"
        }
    }
    
    var tabSystemImageName:String{
        switch self{
        case .summary: return "house.fill"
        case .tasks: return "text.badge.checkmark"
        }
    }
}
