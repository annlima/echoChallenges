//
//  LocationManager.swift
//  echo
//
//  Created by Dicka J. Lezama on 03/03/24.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var authorizationStatus: CLAuthorizationStatus?
    private let locationManager = CLLocationManager()
    @Published var currentLocation: CLLocationCoordinate2D?

    override init() {
        super.init()
        locationManager.delegate = self
    }

    func requestLocationAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }

    func startLocationUpdates() {
        locationManager.startUpdatingLocation()
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
        switch manager.authorizationStatus {
        case .notDetermined:
            // Now, request authorization is moved to an explicit user action, so we don't request it here.
            break
        case .restricted, .denied:
            // Handle restricted or denied cases.
            break
        case .authorizedWhenInUse, .authorizedAlways:
            // Start location updates if permission is given.
            startLocationUpdates()
        @unknown default:
            break
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocation = locations.last?.coordinate
    }
}


