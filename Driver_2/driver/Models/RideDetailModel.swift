//
//  RideDetailModel.swift
//  driver
//
//  Created by Ammar Ahmed on 26/08/1445 AH.
//

import Foundation
import CoreLocation
import MapKit

class RideDetailModel: ObservableObject {
    @Published var rideDetails: [RideDetail] = []
}

struct RideDetail: Codable, Identifiable,Hashable {
    var id: String
    var driverID: String
    var passengerID: String
    var passengerName:String
    var passengerKind:String
    var pickupName: String
    var dropoffName: String
    var pickupLocation:Location2D
    var dropoffLocation:Location2D
    var startTime: Date?
    var endTime: Date?
    var fare: Double
    var status: RideStatus
    
}



enum RideStatus: String, Codable,Hashable {
    case inProgress, completed, cancelled , pending
    
}

// Assuming RideDetailModel and RideDetail structs, and RideStatus enum are defined elsewhere
extension RideDetailModel {
    static var example: RideDetailModel {
        let model = RideDetailModel()
        model.rideDetails = [
            RideDetail(
                id: "req1",
                driverID: "driver123",
                passengerID: "passenger456",
                passengerName: "John Doe",
                passengerKind: "Miss",
                pickupName: "100 Main St",
                dropoffName: "200 Elm St",
                pickupLocation: Location2D(latitude: 24.6107, longitude: 46.8032),
                dropoffLocation: Location2D(latitude: 24.6161, longitude: 46.5673),
                startTime: nil,
                endTime: nil,
                fare: 20.50,
                status: .pending
            ),
            RideDetail(
                id: "req2",
                driverID: "driver124",
                passengerID: "passenger457",
                passengerName: "Jane Smith",
                passengerKind: "Mr",
                pickupName: "300 Pine St",
                dropoffName: "400 Oak St",
                pickupLocation: Location2D(latitude: 24.5437, longitude: 46.6276),
                dropoffLocation: Location2D(latitude: 24.8495, longitude: 46.7410),
                startTime: nil,
                endTime: nil,
                fare: 25.75,
                status: .pending
            )
        ]
        return model
    }
}
