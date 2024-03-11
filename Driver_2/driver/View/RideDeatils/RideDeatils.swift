//
//  SwiftUIView.swift
//  driver
//
//  Created by Ammar Ahmed on 26/08/1445 AH.
//

import SwiftUI
import MapKit

struct RideDeatilsView: View {
    @Environment(\.dismiss) var dismiss
     var rideDeatils:RideDetail
    
   

    var body: some View {
        NavigationStack{
            ScrollView{
                
                MapView(rideDetail: rideDeatils)
                    .frame(height: 300)
                
                
                VStack(alignment:.leading){
                    Divider()
                    Text("Heading to"
                        .uppercased())
                    .font(.caption)
                    .foregroundStyle(.neutral)
                    
                    VStack{
                        HStack(alignment:.center){
                            Text(rideDeatils.dropoffName)
                                .font(.title2)
                                .bold()
                            
                            Spacer()
                            
                            VStack(alignment:.leading){
                                HStack{
                                    Text("20")
                                        .font(.title2)
                                        .bold()
                                        .foregroundStyle(.success)
                                    Text("mins")
                                        .font(.title3)
                                        .foregroundStyle(.success)
                                }
                                Text("\(rideDeatils.fare.formatted()) km")
                                    .font(.caption)
                                    .foregroundStyle(.neutral)
                            }
                        }
                    }
                    Divider()
                    Text("Guest information"
                        .uppercased())
                    .font(.caption)
                    .foregroundStyle(.neutral)
                    
                    VStack(alignment:.leading){
                        
                        HStack{
                            HStack{
                                Avatar(fullName: rideDeatils.passengerName)
                                VStack(alignment:.leading){
                                    Text("\(rideDeatils.passengerKind).\(rideDeatils.passengerName)")
                                        .font(.title3)
                                        .bold()
                                        .foregroundStyle(.primary)
                                    Text("VIP").font(.caption)
                                        .foregroundStyle(.secondary)
                                    
                                    
                                }
                                
                            }
                            Spacer()
                            VStack(alignment:.leading){
                                HStack{
                                    Image(systemName: "figure.2.and.child.holdinghands")
                                        .font(.caption)
                                        .foregroundStyle(.primary)
                                    
                                    Text("1 Adult")
                                        .font(.footnote)
                                        .foregroundStyle(.secondary)
                                }
                                
                                HStack{
                                    Image(systemName: "bag")
                                        .font(.caption)
                                        .foregroundStyle(.primary)
                                    
                                    Text("no bages")
                                        .font(.footnote)
                                        .foregroundStyle(.secondary)
                                }
                            }
                        }
                        
                    }
                    
                    Divider()
                    Text("Flight information"
                        .uppercased())
                    .font(.caption)
                    .foregroundStyle(.neutral)
                    
                    VStack{
                        HStack{
                            HStack{
                                Image(systemName: "airplane.arrival")
                                    .font(.caption)
                                    .foregroundStyle(.primary)
                                
                                Text("JED")
                                    .font(.footnote)
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                            
                            RequestStatusUI(requestStatus: rideDeatils.status)
                        }
                        
                        HStack{
                            HStack{
                                Image(systemName: "door.sliding.left.hand.closed")
                                    .font(.caption)
                                    .foregroundStyle(.primary)
                                
                                VStack(alignment:.leading){
                                    Text("Terminal")
                                        .font(.footnote)
                                        .foregroundStyle(.secondary)
                                    Text("5")
                                        .font(.caption)
                                        .foregroundStyle(.primary)
                                        .bold()
                                }
                            }
                            Spacer()
                            VStack(alignment:.leading){
                                HStack{
                                    Image(systemName: "arrow.down.right.circle")
                                        .font(.caption)
                                        .foregroundStyle(.success)
                                    
                                    Text("On Time")
                                        .font(.footnote)
                                        .foregroundStyle(.success)
                                        .bold()
                                }
                                HStack{
                                    Image(systemName: "clock")
                                        .font(.caption)
                                        .foregroundStyle(.success)
                                    
                                    Text("12:30 Mins")
                                        .font(.footnote)
                                        .foregroundStyle(.success)
                                        .bold()
                                }
                                
                            }
                            
                        }
                        
                    }
                   
                    
                }
                .padding()
                .toolbar{
                    ToolbarItem(placement: .topBarLeading){
                        Button("Summary",role: .cancel){
                            dismiss()
                        }
                    }
                    ToolbarItem(placement: .bottomBar){
                        Button{}label: {
                            HStack{
                                Image(systemName: "qrcode.viewfinder")
                                    .font(.title3)
                                    .foregroundStyle(.orangeLight)
                                Text("Scan QR")
                                    .font(.title3)
                                    .bold()
                                    .foregroundStyle(.orangeLight)
                            }
                            .padding(8)
                            .cornerRadius(14)
                        }
                        .buttonStyle(.bordered)
                        .navigationTitle(rideDeatils.passengerName)
                        .navigationBarTitleDisplayMode(.inline)
                    }
                }
                
            }
        }
        }
    
}

#Preview {
    RideDeatilsView(rideDeatils: RideDetailModel
        .example
        .rideDetails[0])
}
