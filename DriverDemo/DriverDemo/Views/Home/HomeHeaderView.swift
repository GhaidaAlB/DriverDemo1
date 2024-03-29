//
//  HomeHeaderView.swift
//  DriverDemo
//
//  Created by Ammar Ahmed on 21/08/1445 AH.
//

import SwiftUI

struct HomeHeaderView: View {
    let user = UserProfileData.example
    var fullName:String
    var firstName:String
    @State private var isBellActive:Bool = false
    @State private var isBusniessCard:Bool = false
    
    var body: some View {
        HStack{
            HStack(spacing:15){
                Button{
                    isBusniessCard.toggle()
                }label: {
                    Avatar(imageName:fullName,size:50)
                }
               
               
                WelcomeUser(firstName: firstName)
            }
            Spacer()
            Button{
                isBellActive.toggle()
            }label: {
                Image(systemName: "bell.fill")
                    .font(.system(size: 20))
                    .foregroundStyle(.gray)
                    
            }
            .buttonStyle(.plain)
        }
        .sheet(isPresented: $isBellActive){
            UnAvailableView()
        }
        .popover(isPresented: $isBusniessCard){
            BusinessCard(model: user)
                .presentationDetents([.fraction(0.3)])
                
        }
        
        
    }
}

#Preview {
    HomeHeaderView(fullName: "AvaThompsom", firstName: "Ava")
}
