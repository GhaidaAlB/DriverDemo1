//
//  CustomAnnotiation.swift
//  driver
//
//  Created by Ammar Ahmed on 28/08/1445 AH.
//

import SwiftUI
import MapKit

struct CustomAnnotationView: View {
    var name: String
    var coordinate: CLLocationCoordinate2D

    var body: some View {
        VStack {
            
            Image(systemName: "mappin.circle.fill")
                .foregroundColor(.red)
                .imageScale(.large)
            Text(name)
                .font(.caption)
        }
    
    }
}


#Preview {
    CustomAnnotationView(name: RideDetailModel.example.rideDetails[0].pickupName, coordinate: RideDetailModel.example.rideDetails[0].pickupLocation.clLocation)
}
