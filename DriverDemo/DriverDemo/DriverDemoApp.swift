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

       var body: some Scene {
           WindowGroup {
               MainView()
                   .modelContainer(for: [Category.self,
                                         Task.self])
           }
           
    }
}
