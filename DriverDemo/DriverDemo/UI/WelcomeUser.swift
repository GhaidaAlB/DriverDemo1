//
//  WelcomeUser.swift
//  DriverDemo
//
//  Created by Ammar Ahmed on 21/08/1445 AH.
//

import SwiftUI

struct WelcomeUser: View {
    var firstName:String
    var body: some View {
        VStack(alignment:.leading){
            Text("Welcome back ,")
                .bold()
                .font(.system(size: 15))
                .fontDesign(.default)
            
            Text(firstName)
                .foregroundStyle(.gray)
                .font(.system(size: 14))
        }
    }
}

#Preview {
    WelcomeUser(firstName: "Ava")
}
