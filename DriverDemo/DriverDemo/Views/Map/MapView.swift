
import MapKit
import SwiftUI


struct MapView: View {
    @State private var posiation:MapCameraPosition = .userLocation(fallback: .automatic)
    @State private var isShow:Bool = true
    
    var body:some View {
        Map(position:$posiation){
            
        }
        .mapControls{
            MapUserLocationButton()
        }
        .onAppear{
                CLLocationManager().requestWhenInUseAuthorization()
        }
        
///Todo : complet the view
       
      
    }
}

#Preview {
    MapView()
}
