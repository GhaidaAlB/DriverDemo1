//
//  CoordinatorView.swift
//  DriverDemo
//
//  Created by Ammar Ahmed on 21/08/1445 AH.
//

import SwiftUI

struct CoordinatorView: View {
    @EnvironmentObject var coordinator: Coordinator 
    var body: some View {
        TabView(selection: $coordinator.selectedTab) {
            ForEach(Tab.allCases, id: \.self) { tab in
                tabView(for: tab)
                    .tabItem {
                        Label(tab.title, systemImage: tab.systemImageName)
                    }
                    .tag(tab)
            }
        }
    }
    
    @ViewBuilder
    private func tabView(for tab: Tab) -> some View {
        switch tab {
        case .home:
            NavigationStack(path: $coordinator.path) {
                coordinator.build(page: .home)
                    .navigationDestination(for: MyPage.self) { page in
                        coordinator.build(page: page)
                    }
                    .sheet(item: $coordinator.sheet) { sheet in
                        coordinator.build(sheet: sheet)
                    }
            }
        case .map, .tasks, .services,.settings:
            UnAvailableView()
        }
    }
}



#Preview {
    CoordinatorView()
}
