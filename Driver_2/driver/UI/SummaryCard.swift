//
//  SummaryCard.swift
//  driver
//
//  Created by Ammar Ahmed on 26/08/1445 AH.
//

import SwiftUI

struct SummaryCard: View {
    @EnvironmentObject var appDitails:AppCoordinator
    var rideRequest:RideRequest
    
    var body: some View {
     
       
            
        Button(action: {
            appDitails.selectedRideDetail(rideId: rideRequest.id)
        }, label: {
                    VStack(alignment:.leading,spacing:25){
                        HStack(alignment: .top){
                            RideSummary(rideRequest:rideRequest)
                            Spacer()
                            Image(systemName: "arrow.forward")
                                .foregroundStyle(.orangeDark)
                        }
                    
                    Text("Start Trip")
                        .frame(maxWidth: .infinity)
                        .padding(10)
                        .background(Color(.orangeDark))
                        .cornerRadius(10)
                        .foregroundStyle(.white)
                        .bold()
                        .onTapGesture {
                            print("p2")
                        }
                    }
                    
                    .padding()
                    .background(.bg)
                    .cornerRadius(7)
                    .frame(maxWidth: .infinity)
                    .shadow(color:.shadow.opacity(0.2) ,radius: 5,x: 3,y:10)
                })
                .buttonStyle(.plain)
                
                   
              
        
        
    }
}

#Preview {
    SummaryCard(rideRequest: RideRequestModel.example.rideRequests[1])
}
