//
//  RequestStatus.swift
//  driver
//
//  Created by Ammar Ahmed on 26/08/1445 AH.
//

import SwiftUI

struct RequestStatusUI: View {
    var requestStatus:RideStatus
    
    var statusColor: Color {
        switch requestStatus {
           case .inProgress:
            return Color.blue.opacity(0.5)
           case .completed:
            return Color.success.opacity(0.5)
           case .cancelled:
            return Color.error.opacity(0.5)
        case .pending:
            return Color.gray.opacity(0.3)
      
        }
       }
    var body: some View {
        VStack{
            Text(requestStatus.rawValue.uppercased())
                .foregroundStyle(.black).opacity(0.8)
                .font(.caption)
                
        } .padding([.horizontal],10)
            .foregroundStyle(.black)
            .padding([.vertical],4)
            .background(statusColor)
            .cornerRadius(7)
    }
}

#Preview {
    RequestStatusUI(requestStatus: RideStatus(rawValue: RideRequestModel
        .example
        .rideRequests[0]
        .status.rawValue) ?? RideStatus.pending)
}
