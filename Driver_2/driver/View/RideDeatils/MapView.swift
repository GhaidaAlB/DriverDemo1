//
//  MapView.swift
//  driver
//
//  Created by Ammar Ahmed on 28/08/1445 AH.
//

import SwiftUI
import MapKit



struct MapView: View {
    var rideDetail:RideDetail
    @State private var selectedResult: MKMapItem?
    @State private var route: MKRoute?
    let mapView = MKMapView()
    
    var body: some View {
        Map {
            
            Annotation("Pickup Location", coordinate:rideDetail.pickupLocation.clLocation){ CustomAnnotationView(name:rideDetail.pickupName, coordinate:rideDetail.pickupLocation.clLocation)}
            
            Annotation("Dropoff Location", coordinate:rideDetail.dropoffLocation.clLocation){ CustomAnnotationView(name:rideDetail.dropoffName, coordinate:rideDetail.dropoffLocation.clLocation)}
            
            
            if let route {
                MapPolyline(route)
                    .stroke(.blue, lineWidth: 5)
            }
        }
        .onChange(of: selectedResult){
            getDirections()
        }
        .onAppear {
            self.selectedResult = MKMapItem(placemark: MKPlacemark(coordinate:rideDetail.dropoffLocation.clLocation ))
        }
    }
    
  
    
 
    
    func getDirections() {
        self.route = nil
        
        
        guard selectedResult != nil else { return }
        
     
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark( coordinate:rideDetail.pickupLocation.clLocation))
        request.destination = MKMapItem(placemark: MKPlacemark( coordinate:rideDetail.dropoffLocation.clLocation))
        request.transportType = .automobile
        
        
        
        
            let directions = MKDirections(request: request)
          
         directions.calculate{ response,error in
               guard let routes = response?.routes.first else {return }
               route = routes
               
            }
      
            
          
        
    }
}



#Preview {
    
    MapView(rideDetail: RideDetailModel.example.rideDetails[0])
}

class MapViewCoordinator:NSObject,MKMapViewDelegate{
    func mapView(_ mapView:MKMapView,rendererFor overlay:MKOverlay)->MKOverlayRenderer{
        let renderer = MKPolygonRenderer(overlay: overlay)
        renderer.strokeColor = .blue
        renderer.lineWidth = 5
        
        return renderer
    }
}
