//
//  MapView.swift
//  echo
//
//  Created by Dicka J. Lezama on 03/03/24.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    //Get user's current location
    static func getUserLocation(locationManager: LocationManager) -> CLLocationCoordinate2D {
            guard let location = locationManager.currentLocation else {
                // Return a default location if current location is nil
                return .init(latitude: 19.04802, longitude: -98.29617)
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
        return .init(center: .myPlaceLocation, latitudinalMeters: 3000, longitudinalMeters: 3000)
    }
}

struct ResizableAnnotationView: View {
    var criticality: ProblemAnnotation.Criticality
    var zoomLevel: Double

    private func sizeForZoomLevel() -> CGFloat {
        // Adjust these thresholds and sizes as needed
        switch zoomLevel {
        case 0..<0.01: return 40 // More zoomed in
        case 0.01..<0.05: return 30
        default: return 20 // More zoomed out
        }
    }

    var body: some View {
        VStack {
            Image(systemName: "mappin")
                .resizable()
                .frame(width: sizeForZoomLevel(), height: sizeForZoomLevel())
                .foregroundColor(color(for: criticality))
            Text("Title") // Replace with your dynamic title if needed
        }
    }

    private func color(for criticality: ProblemAnnotation.Criticality) -> Color {
        switch criticality {
        case .alta: return .red
        case .media: return .yellow
        case .baja: return .green
        }
    }
}



struct MapView: View {
    @State private var cameraPosition: MKCoordinateRegion = .userRegion
    @StateObject private var locationManager = LocationManager()
    @State private var annotations = [ProblemAnnotation]()
    @State private var annotationMode = false
    @State private var showingInputForm = false
    @State private var showingDetails = false
    @State private var selectedAnnotation: ProblemAnnotation?
    @State private var newAnnotationCoordinate: CLLocationCoordinate2D?
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var criticality: ProblemAnnotation.Criticality = .baja
    let criticalityLevels: [ProblemAnnotation.Criticality] = [.baja, .media, .alta]
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $cameraPosition, annotationItems: annotations) { annotation in
                MapAnnotation(coordinate: annotation.coordinate) {
                    ResizableAnnotationView(criticality: annotation.criticality, zoomLevel: cameraPosition.span.latitudeDelta)
                        .onTapGesture {
                            if !annotationMode {
                                selectedAnnotation = annotation
                                showingDetails = true
                            }
                        }
                }
            }
            .edgesIgnoringSafeArea(.all)
            
            // Invisible overlay for detecting taps
            Color.clear
                .contentShape(Rectangle())
                .onTapGesture {
                    if annotationMode {
                        // Approximate coordinate based on the center of the map
                        // This is a simplification and may not be precise
                        newAnnotationCoordinate = cameraPosition.center
                        showingInputForm = true
                    } else {
                    
                    }
                }
            
            VStack {
                Spacer()
                
                //Button to enter/exit annotation mode
                Button(action: {
                    annotationMode.toggle()
                }) {
                    Image(systemName: annotationMode ? "mappin.slash.circle.fill" : "mappin.and.ellipse.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding()
                        .tint(Color("AccentColor"))
                }
                
                if annotationMode {
                    
                    //Button to create new annotation on user's current location
                    Button(action: {
                        newAnnotationCoordinate = locationManager.currentLocation
                        newAnnotationCoordinate = cameraPosition.center
                        showingInputForm = true
                        print("Button activated")
                        
                    }) {
                        Image(systemName: "location.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50, alignment: .topTrailing)
                            .padding()
                            .tint(Color("AccentColor"))
                    }
                }
            }
        }
        .sheet(isPresented: $showingInputForm, content: {
                            AnnotationInputView()
                                })
        .sheet(isPresented: $showingDetails) {
            if let selectedAnnotation = selectedAnnotation {
                AnnotationDetailView(annotation: $selectedAnnotation)
            }
        }

    }
    
    private func addAnnotationAtCurrentLocation() {
        guard let currentLocation = locationManager.currentLocation else { return }
        // Set the coordinate for the new annotation
        newAnnotationCoordinate = currentLocation
        // Show the input form
        showingInputForm = true
    }
    
    private func color(for criticality: ProblemAnnotation.Criticality) -> Color {
        switch criticality {
        case .alta:
            return .red
        case .media:
            return .yellow
        case .baja:
            return .green
        }
    }
    
    
    
}

#Preview {
    MapView()
}
