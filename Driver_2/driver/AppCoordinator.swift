//
//  AppCoordinator.swift
//  driver
//
//  Created by Ammar Ahmed on 26/08/1445 AH.
//

import Combine
import SwiftUI

class AppCoordinator:ObservableObject{
    
    @Published var driverProfile:DriverProfile
    @Published var rideRequest:[RideRequest]
    @Published var rideDeail:[RideDetail]
    @Published var selectedRide:RideDetail?
    @Published var isSelectedRide:Bool
    
    
    
    init(){
        self.driverProfile = DriverProfileModel.example.driverProfile
        self.rideRequest = RideRequestModel.example.rideRequests
        self.rideDeail = RideDetailModel.example.rideDetails
        self.selectedRide = nil
        self.isSelectedRide = false
    }
    
    func selectedRideDetail(rideId:String){
        
         let selected = rideDeail.filter{
            $0.id == rideId
        }
        if !selected.isEmpty{
            isSelectedRide = true
            selectedRide = selected.first
        }
       
    }
  
}
