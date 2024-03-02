//
//  Avatar.swift
//  DriverDemo
//
//  Created by Ammar Ahmed on 21/08/1445 AH.
//

import SwiftUI

struct Avatar: View {
    let imageName: String
    var size: CGFloat = 80
    var borderColor: Color = .white
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(width: size, height: size)
            .background(Color.gray.opacity(0.1))
            .clipShape(Circle())
            .overlay(Circle().stroke(borderColor, lineWidth: 2))
            .shadow(radius: 10)
    }
}

extension Image {
    @ViewBuilder func placeholder<T: View>(when shouldShowPlaceholder: Bool, @ViewBuilder placeholder: () -> T) -> some View {
        if shouldShowPlaceholder {
            placeholder()
        } else {
            self
        }
    }
}


#Preview {
    Avatar(imageName: "AvaThompsom", size: 80, borderColor: .white)
}
