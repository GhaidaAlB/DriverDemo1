//
//  RideRequestModel.swift
//  driver
//
//  Created by Ammar Ahmed on 26/08/1445 AH.
//


import Combine
import SwiftUI
import CoreLocation

class RideRequestModel: ObservableObject {
    @Published var rideRequests: [RideRequest] = []
}

struct RideRequest: Codable, Identifiable,Hashable {
    var id: String
    var passengerID: String
    var passengerName:String
    var passengerKind:String
    var pickupName: String
    var dropoffName: String
    var pickupLocation:Location2D
    var dropoffLocation:Location2D
    var requestedTime: Date
    var status: RideStatus
}

struct Location2D:Codable,Hashable{
    var latitude :Double
    var longitude:Double
    
    var clLocation: CLLocationCoordinate2D {
            CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
    
}

struct AnnotiationMap{
    var title:String
    var coordinate:CLLocationCoordinate2D
}



extension RideRequestModel {
    static var example: RideRequestModel {
        let model = RideRequestModel()
        model.rideRequests = [
            RideRequest(
                id: "req1",
                passengerID: "passenger456",
                passengerName: "John Doe",
                passengerKind: "Miss",
                pickupName: "100 Main St",
                dropoffName: "200 Elm St",
                pickupLocation: Location2D(latitude: 24.6107, longitude: 46.8032),
                dropoffLocation: Location2D(latitude: 24.6161, longitude: 46.5673),
                requestedTime: Date(),
                status: .pending
            ),
            RideRequest(
                id: "req2",
                passengerID: "passenger457",
                passengerName: "Jane Smith",
                passengerKind: "Mr",
                pickupName: "300 Pine St",
                dropoffName: "400 Oak St",
                pickupLocation: Location2D(latitude: 24.5437, longitude: 46.6276),
                dropoffLocation: Location2D(latitude: 24.8495, longitude: 46.7410),
                requestedTime: Date().addingTimeInterval(-3600 * 24),
                status: .pending
            )
        ]
        return model
    }
}


