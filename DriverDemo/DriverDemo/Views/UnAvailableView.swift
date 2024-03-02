//
//  UnReadView.swift
//  DriverDemo
//
//  Created by Ammar Ahmed on 21/08/1445 AH.
//

import SwiftUI

struct UnAvailableView: View {
    
    var body: some View {
        
        NavigationStack{
            ContentUnavailableView(" unavailable view",
                                   systemImage:  "wrench.and.screwdriver.fill"
                                   ,description:
                                    Text("we currently working on this view")
            )

            Spacer()
        }
            
            
    }
}

#Preview {
    UnAvailableView()
}
