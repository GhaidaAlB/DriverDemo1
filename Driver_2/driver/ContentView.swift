//
//  ContentView.swift
//  driver
//
//  Created by Ammar Ahmed on 26/08/1445 AH.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appDitails:AppCoordinator
    
    var body: some View {
      
            NavigationStack{
                ScrollView{
                    VStack {
                        ForEach(appDitails.rideRequest){item in
                            SummaryCard(rideRequest: item)
                                .padding(.vertical,5)
                        }
                        .navigationTitle("Summary").foregroundStyle(.neutralDark)

                        .padding([.horizontal])
                    }
                }
                
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        NavigationLink(destination: DriverProfileView(driverInfo:appDitails.driverProfile)){
                            Avatar(fullName: appDitails.driverProfile.fullName)
                        }
                    }
                }
                .padding(.vertical,20)
                .sheet(isPresented: $appDitails.isSelectedRide){
                    RideDeatilsView(rideDeatils: appDitails.selectedRide!)
                }
               
            }
        }
    
        
}

#Preview {
    ContentView()
        .environmentObject(AppCoordinator())
}
