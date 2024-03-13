//
//  UnavailableView.swift
//  driver
//
//  Created by Ammar Ahmed on 03/09/1445 AH.
//

import SwiftUI

struct UnavailableView: View {
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
    UnavailableView()
}
