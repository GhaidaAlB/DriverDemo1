//
//  DriverProfileModal.swift
//  driver
//
//  Created by Ammar Ahmed on 26/08/1445 AH.
//
import Combine
import SwiftUI

class DriverProfileModel: ObservableObject {
    @Published var driverProfile: DriverProfile
    
    init(driverProfile: DriverProfile) {
        self.driverProfile = driverProfile
    }
}

struct DriverProfile: Codable, Identifiable {
    var id: String
    var fullName: String
    var email: String
    var phoneNumber: String
    var licenseNumber: String
    var vehicleInfo: VehicleInfo
    var ratings: Double
    var status: DriverStatus
 
}

struct VehicleInfo: Codable {
    var make: String
    var model: String
    var year: Int
    var color: String
    var licensePlateNumber: String
}

enum DriverStatus: String, Codable {
    case available, busy, offline
}

extension DriverProfileModel {
    static var example: DriverProfileModel {
        let exampleDriverProfile = DriverProfile(
            id: "driver123",
            fullName: "John Doe",
            email: "johndoe@example.com",
            phoneNumber: "+1234567890",
            licenseNumber: "D123456789",
            vehicleInfo: VehicleInfo(
                make: "Toyota",
                model: "Prius",
                year: 2020,
                color: "sky",
                licensePlateNumber: "XYZ1234"
            ),
            ratings: 4.8,
            status: .available
        )
        return DriverProfileModel(driverProfile: exampleDriverProfile)
    }
}
