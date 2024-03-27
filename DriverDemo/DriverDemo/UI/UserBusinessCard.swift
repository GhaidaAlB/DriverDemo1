import SwiftUI

struct BusinessCard: View {
    let model: UserProfileData
    @State private var shareTheUserInfo = false
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                HStack{
                    Text(model.fullName)
                        .font(.title)
                        .bold()
                    
                    Spacer()
                    
                    Button{
                        shareTheUserInfo.toggle()
                    }label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                    
                }
                
                Text(model.position)
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                Divider()
                
                HStack {
                    Image(systemName: "envelope")
                    Text(model.email)
                }
                
                HStack {
                    Image(systemName: "phone")
                    Text(model.telephone)
                }
                
                HStack {
                    Image(systemName: "person")
                    Text(model.lineMangeName)
                }
            }
            
            
            .padding(.horizontal)
            
            
            
            
            .sheet(isPresented: $shareTheUserInfo) {
                ActivityView(activityItems: [self.shareContent()], applicationActivities: nil)
            }
        }
    }
    
    private func shareContent() -> String {
        """
        Name: \(model.fullName)
        Position: \(model.position)
        Email: \(model.email)
        Telephone: \(model.telephone)
        Line Manager: \(model.lineMangeName)
        """
    }
}

#Preview {
    BusinessCard(model:UserProfileData.example)
}
