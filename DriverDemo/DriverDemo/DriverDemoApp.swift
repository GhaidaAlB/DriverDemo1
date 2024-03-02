//
//  DriverDemoApp.swift
//  DriverDemo
//
//  Created by Ammar Ahmed on 21/08/1445 AH.
//

import SwiftUI
import SwiftData

@main
struct DriverDemoApp: App {

    @StateObject private var coordinator = Coordinator()

       var body: some Scene {
           WindowGroup {
               CoorinatorView()
                   .environmentObject(coordinator)
           }
           .modelContainer(for: UserProfileData.self)
    }
}
