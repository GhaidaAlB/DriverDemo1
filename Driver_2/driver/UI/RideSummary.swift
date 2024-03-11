//
//  RideSummary.swift
//  driver
//
//  Created by Ammar Ahmed on 26/08/1445 AH.
//

import SwiftUI

struct RideSummary: View {
    var rideRequest:RideRequest
    
    var body: some View {
        
        VStack(alignment:.leading){
            
                Text("\(rideRequest.passengerKind). \(rideRequest.passengerName)")
                    .bold()
                    .foregroundStyle(.primary)
                    
            Text(rideRequest.dropoffName)
                .foregroundStyle(.neutral)
                .font(.caption)
            
            RequestStatusUI(requestStatus: rideRequest.status)
            
        }
        
    }
}

#Preview {
    RideSummary(rideRequest: RideRequestModel
        .example
        .rideRequests[1])
}
