//
//  SummaryView.swift
//  driver
//
//  Created by Ammar Ahmed on 03/09/1445 AH.
//

import SwiftUI

struct SummaryView: View {
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
                .padding(.vertical,20)
                .sheet(isPresented: $appDitails.isSelectedRide){
                    RideDeatilsView(rideDeatils: appDitails.selectedRide!)
                }
               
            }
        }
    
        
}

#Preview {
    SummaryView()
        .environmentObject(AppCoordinator())
}
