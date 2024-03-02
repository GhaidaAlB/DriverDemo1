//
//  CoordinatorView.swift
//  DriverDemo
//
//  Created by Ammar Ahmed on 21/08/1445 AH.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var coordinator: Coordinator

    var body: some View {
        TabView(selection: $coordinator.selectedTab) {
            ForEach(Tab.allCases, id: \.self) { tab in
                coordinator.viewForTab(tab)
                    .tabItem {
                        coordinator.tabItem(for: tab)
                    }
                    .tag(tab)
            }
        }
    }
}

#Preview {
    MainView()
}
