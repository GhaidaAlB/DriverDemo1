//
//  RideDeatilsCoordinator.swift
//  driver
//
//  Created by Ammar Ahmed on 28/08/1445 AH.
//

import Foundation
import MapKit


class RideDeatilsCoordinator:ObservableObject{
    
    @Published var annotiationsMap:[AnnotiationMap]?
    
    
}

struct AnnotiationMap{
    var title:String
    var coordinate:CLLocationCoordinate2D
}
