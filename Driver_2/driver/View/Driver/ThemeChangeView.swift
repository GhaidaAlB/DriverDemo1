//
//  ThemeChangeView.swift
//  driver
//
//  Created by Ammar Ahmed on 28/08/1445 AH.
//

import SwiftUI

struct ThemeChangeView: View {
    var scheme:ColorScheme
    @AppStorage("userTheme")private var useTheme:Theme = .systemDefault
    @Namespace private var animated
    
    var body: some View {
        VStack(spacing:15){
            Circle()
                .fill(useTheme.color(scheme).gradient)
                .frame(width: 150,height: 150)
            
            Text("Choose a theme")
                .font(.title2.bold())
                .padding(.top,25)
            
            Text("Pop or Subtle , Day or night.'nCustomize your interface")
                .multilineTextAlignment(.center)
            
            HStack(spacing: 0){
                ForEach(Theme.allCases,id:\.rawValue){theme in
                    Text(theme.rawValue)
                        .foregroundStyle(.primary)
                        .padding(.vertical,10)
                        .frame(width: 100)
                        .background{
                            ZStack{
                                if useTheme == theme{
                                    Capsule()
                                        .fill(.bg.opacity(0.3))
                                        .matchedGeometryEffect(id: "activetab", in: animated)
                                }
                            }
                            .animation(.snappy,value:useTheme)
                        }
                        .contentShape(.rect)
                        .onTapGesture {
                            useTheme = theme
                        }
                }
            }
            .padding(3)
            .background(.primary.opacity(0.06),in:.capsule)
            .padding(.top,20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .frame(height:450)
        .background(.mode)
        .cornerRadius(30)
        .padding(.horizontal)
        .environment(\.colorScheme,scheme)
        
    }
}



enum Theme:String,CaseIterable{
    case systemDefault = "Defualt"
    case dark = "Dark"
    case light = "Light"
    
    func color(_ scheme:ColorScheme)->Color{
        switch self {
            
        case .systemDefault:
            return scheme == .dark ? .moon : .son
        case .dark:
            return .moon
        case .light:
            return .son
        }
    }
    
    var colorScheme:ColorScheme?{
        switch self{
            
        case .systemDefault:
            return nil
        case .dark:
            return .dark
        case .light:
            return .light
        }
    }
}
