//
//  ContentView.swift
//  DriverDemo1
//
//  Created by Ghaida AlBaltan on 02/03/2024.
//

import SwiftUI


struct ContentView: View {
    var body: some View{
        VStack{
            CalendarWidget()
            WeatherWidget()
        }
    }
}
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

