//
//  Coordinator.swift
//  DriverDemo
//
//  Created by Ammar Ahmed on 21/08/1445 AH.
//

import SwiftUI

final class Coordinator: ObservableObject {
    @Published var selectedTab: Tab = .home
    
    init() {
        // Initial setup if needed
    }
    
    @ViewBuilder
    func viewForTab(_ tab: Tab) -> some View {
        switch tab {
        case .home:
            HomeView()
        case .map, .services, .tasks:
            UnAvailableView()
        }
    }
    
    func tabItem(for tab: Tab) -> some View {
        Label(tab.title, systemImage: tab.systemImageName)
    }
}


enum Tab:Hashable,CaseIterable {
    case map
    case home
    case tasks
    case services
    
}

extension Tab {
    var title: String {
        switch self {
        case .home: return "Home"
        case .map: return "Map"
        case .tasks: return "Tasks"
        case .services: return "Services"
        }
    }
    
    var systemImageName: String {
        switch self {
        case .home: return "house.fill"
        case .map: return "map"
        case .tasks: return "text.badge.checkmark"
        case .services: return "wrench.and.screwdriver.fill"
        }
    }
}
