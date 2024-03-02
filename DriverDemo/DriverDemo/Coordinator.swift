//
//  Coordinator.swift
//  DriverDemo
//
//  Created by Ammar Ahmed on 21/08/1445 AH.
//

import SwiftUI

final class Coordinator:ObservableObject{
    
    @Published var path = NavigationPath()
    @Published var page:MyPage = .home
    @Published var selectedTab:Tab = .home
    @Published var sheet:MySheet?
    
    
    func goToHome(){
        path.removeLast(path.count)
    }
    
    func goToPage(_ page:MyPage){
        path.append(page)
    }
    
    func goPopup(sheet:MySheet){
        self.sheet = sheet
    }
    
    func dismissSheet(){
        self.sheet = nil
    }
    
    @ViewBuilder
    func build(page:MyPage)-> some View {
        switch page {
        case .home:
            HomeView()
        case .map:
            UnAvailableView()
        case .tasks:
            UnAvailableView()
        case .services:
            UnAvailableView()
        case .settings:
            UnAvailableView()
        }
    }
    
    @ViewBuilder
    func build(sheet:MySheet)-> some View {
        switch sheet {
        case .popup:
            UnAvailableView()
        }
    }
    
    @ViewBuilder
    func buildTabView(selectedTab: Binding<Tab>) -> some View {
        TabView(selection: selectedTab) {
            ForEach(Tab.allCases, id: \.self) { tab in
                self.buildView(for: tab)
                    .tabItem {
                        Label(tab.title, systemImage: tab.systemImageName)
                    }
                    .tag(tab)
            }
        }
    }
    
    private func buildView(for tab: Tab) -> some View {
        
        switch tab {
        case .home:
            return AnyView(build(page: .home))
        case .map, .tasks, .services,.settings:
            return AnyView(UnAvailableView())
        }
    }
}

enum MyPage:String,CaseIterable,Identifiable{
    case home,map,tasks,services,settings
    
    var id:String{self.rawValue}
}

enum MySheet:String,CaseIterable,Identifiable{
    case popup
    
    var id:String {self.rawValue}
}

enum Tab:Hashable,CaseIterable{
    case map,tasks,home,services,settings
    

}


extension Tab {
    var title: String {
        switch self {
        case .home: return "Home"
        case .map: return "Map"
        case .tasks: return "Tasks"
        case .services: return "Services"
        case .settings:return "Setting"
        }
    }
    
    var systemImageName: String {
        switch self {
        case .home: return "house.fill"
        case .map: return "map"
        case .tasks: return "text.badge.checkmark"
        case .services: return "wrench.and.screwdriver.fill"
        case .settings: return "gearshape.fill"
        }
    }
}
