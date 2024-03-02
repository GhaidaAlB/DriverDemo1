//
//  ContentView.swift
//  DriverDemo
//
//  Created by Ammar Ahmed on 21/08/1445 AH.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            HomeView().tabItem(){
            Image(systemName: "phone.fill")
                Text("Home")
            }
        }
    }
}

#Preview {
    ContentView()
}
