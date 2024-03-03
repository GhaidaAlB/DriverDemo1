//
//  MapCoordinator.swift
//  DriverDemo
//
//  Created by Ammar Ahmed on 22/08/1445 AH.
//

import CoreLocation
import MapKit


class Coordinator: NSObject, MKMapViewDelegate, CLLocationManagerDelegate {
    var mapView: MapView
    var locationManager: CLLocationManager

    init(_ mapView: MapView, locationManager: LocationManager) {
        self.mapView = mapView
        self.locationManager = locationManager.locationManager
        super.init()
        self.locationManager.delegate = self
        self.requestLocationAuthorization()
    }

    func requestLocationAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .notDetermined, .restricted, .denied:
            print("Location access denied or restricted")
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.startUpdatingLocation()
        default:
            break
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Handle location updates
        if let location = locations.last {
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, latitudinalMeters: 1000, longitudinalMeters: 1000)
            mapView.locationManager.location = location
            mapView.uiView?.setRegion(region, animated: true)
        }
    }
}

class LocationManager: ObservableObject {
    let locationManager = CLLocationManager()
    @Published var location: CLLocation?

    init() {
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
}
