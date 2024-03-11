//
//  driverApp.swift
//  driver
//
//  Created by Ammar Ahmed on 26/08/1445 AH.
//

import SwiftUI

@main
struct driverApp: App {
    @StateObject var appCoordinator = AppCoordinator()
    @AppStorage("userTheme") private var useTheme:Theme = .systemDefault
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .background()
                .preferredColorScheme(useTheme.colorScheme)
                .environmentObject(appCoordinator)
            
        }
    }
}
