//
//  UnReadView.swift
//  DriverDemo
//
//  Created by Ammar Ahmed on 21/08/1445 AH.
//

import SwiftUI

struct UnReadView: View {
    
    @StateObject private var coordinator = Coordinator()
    
    var body: some View {
        
        NavigationStack{
            ContentUnavailableView(" unavailable view",
                                   systemImage:  "wrench.and.screwdriver.fill"
                                   ,description:
                                    Text("we currently working on this view")
            )
            
            Button("Back"){
                coordinator.goToHome()
            }
            
            
            Spacer()
        }
            
            
    }
}

#Preview {
    UnReadView()
}
