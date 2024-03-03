//
//  MapView.swift
//  echo
//
//  Created by Dicka J. Lezama on 29/02/24.
//

import SwiftUI
import MapKit
import CoreLocation

extension CLLocationCoordinate2D {
    //Get user's current location
    static func getUserLocation(locationManager: LocationManager) -> CLLocationCoordinate2D {
            guard let location = locationManager.currentLocation else {
                // Return a default location if current location is nil
                return .init(latitude: 0.0, longitude: 0.0)
            }
        return .init(latitude: location.latitude, longitude: location.longitude)
    }
    
    //myPlace location predetermined by the user in the beggining
    static var myPlaceLocation: CLLocationCoordinate2D {
        return .init(latitude: 19.04802, longitude: -98.29617) // Placeholder - need to get the user's "mi casa"
    }
    
}

extension MKCoordinateRegion {
    static var userRegion: MKCoordinateRegion {
        return .init(center: .myPlaceLocation, latitudinalMeters: 8000, longitudinalMeters: 8000)
    }
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    @Published var currentLocation: CLLocationCoordinate2D?

    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }

    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
        } else {
            // Handle the case where location services are not enabled
        }
    }

    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.first else { return }
        currentLocation = latestLocation.coordinate
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.startUpdatingLocation()
        case .restricted, .denied:
            // Handle the case where user has denied / restricted location services
            break
        default:
            break
        }
    }
}



struct MapView: View {
    @StateObject private var viewModel = MapViewModel()
    @StateObject private var locationManager = LocationManager()
    @State private var cameraPosition: MKCoordinateRegion = .userRegion
    @State private var annotationModeOn = false
    @State private var showingSeverityPicker = false
    @State private var selectedSeverity: Severity?
    @State private var provisionalLocation: CLLocationCoordinate2D?

    
    private func colorForSeverity(_ severity: Severity) -> Color {
        switch severity {
            case .high: return .red
            case .medium: return .yellow
            case .low: return .green
        }
    }
    
    private func createProvisionalPin(at location: CLLocationCoordinate2D) {
        provisionalLocation = location
        showingSeverityPicker = true
    }
    
    init() {
        // Initialize cameraPosition with the user's myPlace location
        _cameraPosition = State(initialValue: MKCoordinateRegion(center: CLLocationCoordinate2D.myPlaceLocation, latitudinalMeters: 8000, longitudinalMeters: 8000))
    }

    
    var body: some View {
        ZStack {
            Map(coordinateRegion:$cameraPosition, annotationItems: viewModel.annotations) { annotation in
                
                MapAnnotation(coordinate: annotation.coordinate){
                    //map annotation buttons
                    Button(action: {
                        // Action for when the annotation is tapped
                    }) {
                        Circle()
                            .fill(colorForSeverity(annotation.severity))
                            .frame(width: 20, height: 20)
                    }
                }
                
            }
            .ignoresSafeArea(.all)
           
             
            
            //Button to enter/exit annotation mode
            Button(action: {
                annotationModeOn.toggle()
            }, label: {
                Image(systemName: annotationModeOn ? "mappin.slash.circle.fill" : "mappin.and.ellipse.circle.fill")
                    .frame(width: 390, height: 600, alignment: .topTrailing)
                    .tint(Color("AccentColor"))
                    .font(.system(size: 50))
                }
            )
            
            
            if annotationModeOn {
                //Create new anotation wherever the map is clicked
                
                
                
                //Button to create a new annotation in the user's
                Button(action: {
                    createProvisionalPin(at: .getUserLocation(locationManager: locationManager))
                    showingSeverityPicker = true
                }) {
                    Image(systemName: "location.circle.fill")
                        .tint(Color("AccentColor"))
                        .frame(width: 350, height: 750, alignment: .bottomTrailing)
                        .font(.system(size: 50))
                }
                .actionSheet(isPresented: $showingSeverityPicker) {
                    ActionSheet(title: Text("Select Severity"), message: Text("Choose the severity of the case."), buttons: [
                        .default(Text("High")) { selectedSeverity = .high },
                        .default(Text("Medium")) { selectedSeverity = .medium },
                        .default(Text("Low")) { selectedSeverity = .low },
                        .cancel {
                            provisionalLocation = nil
                        }
                    ])
                }
                .onChange(of: selectedSeverity) { newValue in
                    if let severity = newValue, let coordinate = locationManager.currentLocation {
                        viewModel.addAnnotation(coordinate: coordinate, severity: severity)
                    }
                }

            }

        }
        
    }
        
}



#Preview {
    MapView()
}
