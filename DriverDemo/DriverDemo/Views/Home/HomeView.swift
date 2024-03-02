//
//  HomeView.swift
//  DriverDemo
//
//  Created by Ammar Ahmed on 21/08/1445 AH.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    private var user = UserProfileData.example
    
    var body: some View {
        ScrollView{
            VStack{
                HomeHeaderView(fullName: user.image, firstName: user.firstName)
            }
            .padding()
        }
    }
}

#Preview {
    HomeView()
}
