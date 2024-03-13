//
//  TabsView.swift
//  driver
//
//  Created by Ammar Ahmed on 03/09/1445 AH.
//

import SwiftUI

struct TabsView: View {
    @State private var selectedTab: Tabs = .summary
    @EnvironmentObject var appDitails:AppCoordinator

    var body: some View {
        
            TabView(selection: $selectedTab) {
                ForEach(Tabs.allCases, id: \.self) { tab in
                    
                    NavigationStack {
                                     tabView(for: tab)
                            .navigationTitle(tab.tabTitle) // Optionally set navigation title for each tab
                                         .toolbar {
                                             ToolbarItem(placement: .topBarLeading) {
                                                 NavigationLink(destination: DriverProfileView(driverInfo: appDitails.driverProfile)) {
                                                     Avatar(fullName: appDitails.driverProfile.fullName)
                                                 }
                                             }
                                         }
                                 }
                                 .tabItem {
                                     Image(systemName: tab.tabSystemImageName)
                                     Text(tab.tabTitle)
                                 }
                                 .tag(tab)
                    
                }
               
                
            }
           
        }
    
    
    @ViewBuilder
    private func tabView(for tab:Tabs)->some View{
        switch tab{
        case .summary:
            SummaryView()
            
        case .tasks:
            CategoriesView()
        }
    }
}

#Preview {
    TabsView()
}


