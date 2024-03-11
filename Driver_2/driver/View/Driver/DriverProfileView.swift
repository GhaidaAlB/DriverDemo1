//
//  DriverProfileView.swift
//  driver
//
//  Created by Ammar Ahmed on 28/08/1445 AH.
//

import SwiftUI

struct DriverProfileView: View {
    @Environment(\.colorScheme) private var scheme
    
    var driverInfo:DriverProfile
    @State private var changeTheme:Bool = false
    var body: some View {
        NavigationStack{
            VStack{
                

                VStack{
                    Avatar(fullName: driverInfo.fullName,
                           size: .largeTitle,isBold:false)
                    Text(driverInfo.fullName)
                        .foregroundStyle(.secondary)
                }
                List{
                    Section("Personal Information"){
                            HStack{
                                Image(systemName: "bag")
                                    .foregroundStyle(.orangeDark)
                                Text(driverInfo.fullName)
                                    .foregroundStyle(.secondary)
                            }
                        HStack{
                            Image(systemName: "mail")
                                .foregroundStyle(.orangeDark)
                            Text(driverInfo.email)
                                .foregroundStyle(.secondary)
                        }
                        HStack{
                            Image(systemName: "person.text.rectangle")
                                .foregroundStyle(.orangeDark)
                            Text(driverInfo.id)
                                .foregroundStyle(.secondary)
                        }
                    }
                    
                    Section("Vical Information"){
                            HStack{
                                Image(systemName: "car")
                                    .foregroundStyle(.orangeDark)
                                Text("\(driverInfo.vehicleInfo.make) , \(driverInfo.vehicleInfo.model)" )
                                    .foregroundStyle(.secondary)
                            }
                        HStack{
                            Image(systemName: "licenseplate")
                                .foregroundStyle(.orangeDark)
                            Text(driverInfo.vehicleInfo.licensePlateNumber)
                                .foregroundStyle(.secondary)
                        }
                      
                    }
                    
                    Section("Setting"){
                            HStack{
                                Button("Change the theme" ){
                                    changeTheme.toggle()
                                }
                            }
                     
                      
                    }
                    
                }

            }
            
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
          
        }
        
        .sheet(isPresented: $changeTheme, content: {
            ThemeChangeView(scheme: scheme)
                .presentationDetents([.height(450)])
                .presentationBackground(.clear)
        })
        
    }
}

#Preview {
    DriverProfileView(driverInfo: DriverProfileModel.example.driverProfile)
}
