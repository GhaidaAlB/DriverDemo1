//
//  Avatar.swift
//  driver
//
//  Created by Ammar Ahmed on 26/08/1445 AH.
//

import SwiftUI

struct Avatar: View {
    var fullName:String
    var image:Image?
    var size:Font? = .caption
    var isBold:Bool = true
    
    var shortName:String{
        let names = fullName.components(separatedBy: " ")
        if let firstName = names.first, let lastName = names.last {
            let firstInitial = firstName.prefix(1)
            let lastInitial = lastName.prefix(1)
            
            return String(firstInitial+lastInitial)
        }else{
            return ""
        }
        
    }
    
    var body: some View {
        Text(shortName)
            .padding(12)
            .bold(isBold)
            .font(size)
            .foregroundStyle(.white)
            .background(
                Circle()
                    .foregroundStyle(.neutralDark)
            )
            
    }
}

#Preview {
    Avatar(fullName: "Ammar MA")
        .previewLayout(.sizeThatFits)
}
