//
//  WeatherWidget.swift
//  DriverDemo1
//
//  Created by Ghaida AlBaltan on 02/03/2024.
//

import SwiftUI

struct WeatherWidget: View {
    var body: some View {
        VStack {
            Text("Weather Widget")
                .font(.title)
                .padding()
            
            //Placeholder for weather information
            Text("Weather Information goes here")
                .padding()
        }
    }
}

struct WeatherWidget_Previews: PreviewProvider {
    static var previews: some View {
        WeatherWidget()
    }
}
