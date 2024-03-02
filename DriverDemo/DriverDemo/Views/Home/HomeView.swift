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
       
            NavigationStack{
                ScrollView {
                VStack(spacing: 20) {
                    Spacer(minLength: 20)
                    HomeHeaderView(fullName: user.image, firstName: user.firstName)
                        .padding()
                    
                }
                .background(Color.gray.opacity(0.1))
            }
            
            .edgesIgnoringSafeArea(.top)
        }
        }
}

#Preview {
    HomeView()
}
