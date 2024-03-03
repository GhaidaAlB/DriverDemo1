//
//  TabsViews.swift
//  DriverDemo
//
//  Created by Ammar Ahmed on 21/08/1445 AH.
//

import SwiftUI

struct TabsViews: View {
    @State private var selectedTab: Tab = .home

        var body: some View {
            TabView(selection: $selectedTab) {
                ForEach(Tab.allCases, id: \.self) { tab in
                    tabView(for: tab)
                        .tabItem {
                            Image(systemName: tab.systemImageName)
                            Text(tab.title)
                        }
                        .tag(tab)
                }
            }
        }

        @ViewBuilder
        private func tabView(for tab: Tab) -> some View {
            switch tab {
            case .home:
                HomeView()
            case .map:
                MapView()
            case .services, .tasks:
                UnAvailableView()
                    
                   
            }
        }
}

#Preview {
    TabsViews()
}
