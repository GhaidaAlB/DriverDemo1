import SwiftUI
import MapKit

struct MapModleView: UIViewRepresentable {
    @StateObject var locationManager: LocationManager

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Update the view when needed
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self, locationManager: locationManager)
    }
}
