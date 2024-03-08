//
//  MapView.swift
//  echo
//
//  Created by Dicka J. Lezama on 03/03/24.
//

import SwiftUI
import MapKit
import CoreLocation

extension CLLocationCoordinate2D {
    func geocode(completion: @escaping (String?) -> Void) {
        let geocoder = CLGeocoder()
        let location = CLLocation(latitude: self.latitude, longitude: self.longitude)
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            guard let placemark = placemarks?.first, error == nil else {
                completion(nil)
                return
            }
            let address = [placemark.thoroughfare, placemark.locality, placemark.administrativeArea, placemark.postalCode, placemark.country].compactMap { $0 }.joined(separator: ", ")
            completion(address)
        }
    }
}


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
        return .init(center: .myPlaceLocation, latitudinalMeters: 11000, longitudinalMeters: 11000)
    }
}


struct MapView: View {
    @Binding var tabSelection: MainTabBarItem
    @State private var cameraPosition: MKCoordinateRegion = .userRegion
    @StateObject private var locationManager = LocationManager()
    
    //Default annotations
    @State private var annotations: [ProblemAnnotation] = [
        ProblemAnnotation(title: "Relleno intermunicipal de Cholula", description: "El relleno sanitario de San Pedro Cholula viola restricciones federales y pone en riesgo la salud de miles de pobladores, debido a que se construyó cerca de una zona poblada y sobre mantos freáticos", criticality: .alta, coordinate: CLLocationCoordinate2D(latitude: 19.09288, longitude: -98.39399), imageName: "RellenoSanitario"),
        ProblemAnnotation(title: "Socavón de Puebla", description: "El creciente socavón en Puebla nos tiene alarmados. Inició pequeño y ahora es un enorme abismo cerca de nuestras casas. Está destruyendo terrenos y afectando la vida silvestre, probablemente por la extracción excesiva de agua subterránea.", criticality: .alta, coordinate: CLLocationCoordinate2D(latitude: 19.125833, longitude: -98.373611), imageName: "Socavon"),
        ProblemAnnotation(title: "Incendios y plagas en Cerro Zapotecas", description: "El Cerro Zapotecas está deteriorado por incendios y por el gusano descortezador, así como por el uso de agroquímicos, que, en conjunto, han generado un desequilibrio ambiental.", criticality: .media, coordinate: CLLocationCoordinate2D(latitude: 19.075184, longitude: -98.346169), imageName: "QuemaCerroZ"),
        ProblemAnnotation(title: "Tiradero clandestino de ganado", description: "Se deshacen de manera clandestina de porcinos enfermos que terminan de pudrirse en estos terrenos, lo que genera pestilencia y moscas que se meten en sus hogares.", criticality: .alta, coordinate: CLLocationCoordinate2D(latitude: 19.05007, longitude: -98.30251), imageName: "TiraderoClandestino"),
        ProblemAnnotation(title: "Dejan basura tirada de la Feria Nacional de la Michelada", description: "Tras la Feria Nacional de la Michelada, una gran cantidad de basura se acumula en las calles, creando un serio problema sanitario. En pleno calor, el olor resultante es insoportable, afectando la vida diaria y la salud de los residentes.", criticality: .alta, coordinate: CLLocationCoordinate2D(latitude: 19.05728, longitude: -98.30537), imageName: "BasuraFeria"),
        ProblemAnnotation(title: "Acumulación de basura", description: "La situación con la basura en nuestro sector es alarmante. Los desechos se amontonan en las aceras, creando obstáculos para los peatones y emitiendo olores nauseabundos que se intensifican con el calor.", criticality: .media, coordinate: CLLocationCoordinate2D(latitude: 19.05737, longitude: -98.30714), imageName: "tendency2"),
        ProblemAnnotation(title: "Acumulación de basura", description: "La acumulación de basura en nuestras calles se ha convertido en una situación insostenible. Cada esquina está plagada de bolsas de desechos, cajas rotas y restos de comida, atrayendo a roedores e insectos que amenazan nuestra salud.", criticality: .media, coordinate: CLLocationCoordinate2D(latitude: 19.06631, longitude: -98.29913), imageName: "AcumulacionDeBasura"),
        ProblemAnnotation(title: "Acumulación de basura", description: "La basura se ha apoderado de nuestras calles, creando un ambiente insalubre y desagradable. Montones de desechos obstruyen las aceras, y el olor es insoportable, especialmente durante las tardes cálidas.", criticality: .alta, coordinate: CLLocationCoordinate2D(latitude: 19.072320, longitude: -98.292464), imageName: "AcumulacionDeBasura2"),
        ProblemAnnotation(title: "Incendio", description: "Incendio en un predio ubicado en la Junta Auxiliar de San Juan Tlautla.", criticality: .alta, coordinate: CLLocationCoordinate2D(latitude: 19.09564, longitude: -98.34444), imageName: "Incendio"),
        ProblemAnnotation(title: "Tiran visceras en la via pública", description: "Tiraron vísceras de animales en la vía pública.", criticality: .alta, coordinate: CLLocationCoordinate2D(latitude: 19.066291, longitude: -98.325167), imageName: "ViscerasViaPublica"),
        ProblemAnnotation(title: "Queman de desechos y pasto", description: "Quemaron basura, llantas y pastizal en un terreno baldío.", criticality: .alta, coordinate: CLLocationCoordinate2D(latitude: 19.05155, longitude: -98.31585), imageName: "QuemaDeBasura"),
        ProblemAnnotation(title: "Falta de servicios de recolección de basura", description: "Se denuncia la falta de servicios de recolección de basura.", criticality: .alta, coordinate: CLLocationCoordinate2D(latitude: 19.067682, longitude: -98.325066), imageName: "FaltaDeRecoleccion"),
        ProblemAnnotation(title: "Falta de servicios de recolección de basura", description: "Se denuncia la falta de servicios de recolección de basura.", criticality: .alta, coordinate: CLLocationCoordinate2D(latitude: 19.067682, longitude: -98.325066), imageName: "FaltaDeRecoleccion"),
        ProblemAnnotation(title: "Encharcamiento por basura", description: "La acumulación de basura cuasó un encharcamiento.", criticality: .alta, coordinate: CLLocationCoordinate2D(latitude: 19.072320, longitude: -98.300234), imageName: "Encharcamiento"),
        ProblemAnnotation(title: "Acumulación de basura", description: "Los servicios de limpieza parecen superados por la magnitud del problema, dejando a nuestra comunidad en una constante lucha contra la suciedad.", criticality: .alta, coordinate: CLLocationCoordinate2D(latitude: 19.061476, longitude: -98.303807), imageName: "AcumulacionDeBasura3"),
        ProblemAnnotation(title: "Quema de pastizales", description: "Se quemaron 300 m^2 de pastizal.", criticality: .alta, coordinate: CLLocationCoordinate2D(latitude: 19.061476, longitude: -98.303807), imageName: "QuemaDePastizales"),
        ProblemAnnotation(title: "Quema de pastizales", description: "Se quemaron 300 m^2 de pastizal.", criticality: .media, coordinate: CLLocationCoordinate2D(latitude: 19.06629, longitude: -98.30844), imageName: "QuemaDePastizales2"),
        ProblemAnnotation(title: "Quema de pastizales", description: "Se quemaron 700 m^2 de pastizal.", criticality: .media, coordinate: CLLocationCoordinate2D(latitude: 19.075728, longitude: -98.310373), imageName: "QuemaDePastizales3"),
               
               //CLONES
        ProblemAnnotation(title: "Tiradero de basura", description: "El tiradero de Cholula pone en riesgo la salud de miles de pobladores, debido a que se construyó cerca de una zona poblada y sobre mantos freáticos", criticality: .alta, coordinate: CLLocationCoordinate2D(latitude: 19.084955, longitude: -98.321090), imageName: "RellenoSanitario"),
        ProblemAnnotation(title: "Socavón de Puebla", description: "El creciente socavón en Puebla nos tiene alarmados. Inició pequeño y ahora es un enorme abismo cerca de nuestras casas. Está destruyendo terrenos y afectando la vida silvestre, probablemente por la extracción excesiva de agua subterránea.", criticality: .alta, coordinate: CLLocationCoordinate2D(latitude: 19.096833, longitude: -98.283611), imageName: "Socavon"),
        ProblemAnnotation(title: "Incendios y plagas en Cerro Zapotecas", description: "El Cerro Zapotecas está deteriorado por incendios y por el gusano descortezador, así como por el uso de agroquímicos, que, en conjunto, han generado un desequilibrio ambiental.", criticality: .media, coordinate: CLLocationCoordinate2D(latitude: 19.085184, longitude: -98.356169), imageName: "QuemaCerroZ"),
        ProblemAnnotation(title: "Tiradero clandestino de ganado", description: "Se deshacen de manera clandestina de porcinos enfermos que terminan de pudrirse en estos terrenos, lo que genera pestilencia y moscas que se meten en sus hogares.", criticality: .alta, coordinate: CLLocationCoordinate2D(latitude: 19.06728, longitude: -98.29537), imageName: "TiraderoClandestino"),
        ProblemAnnotation(title: "Dejan basura tirada de la Feria Nacional de la Michelada", description: "Tras la Feria Nacional de la Michelada, una gran cantidad de basura se acumula en las calles, creando un serio problema sanitario. En pleno calor, el olor resultante es insoportable, afectando la vida diaria y la salud de los residentes.", criticality: .alta, coordinate: CLLocationCoordinate2D(latitude: 19.06728, longitude: -98.31714), imageName: "BasuraFeria"),
        ProblemAnnotation(title: "Acumulación de basura", description: "La situación con la basura en nuestro sector es alarmante. Los desechos se amontonan en las aceras, creando obstáculos para los peatones y emitiendo olores nauseabundos que se intensifican con el calor.", criticality: .media, coordinate: CLLocationCoordinate2D(latitude: 19.06737, longitude: -98.31714), imageName: "tendency2"),
        ProblemAnnotation(title: "Acumulación de basura", description: "La acumulación de basura en nuestras calles se ha convertido en una situación insostenible. Cada esquina está plagada de bolsas de desechos, cajas rotas y restos de comida, atrayendo a roedores e insectos que amenazan nuestra salud.", criticality: .media, coordinate: CLLocationCoordinate2D(latitude: 19.07631, longitude: -98.282464), imageName: "AcumulacionDeBasura"),
        ProblemAnnotation(title: "Acumulación de basura", description: "La basura se ha apoderado de nuestras calles, creando un ambiente insalubre y desagradable. Montones de desechos obstruyen las aceras, y el olor es insoportable, especialmente durante las tardes cálidas.", criticality: .media, coordinate: CLLocationCoordinate2D(latitude: 19.082320, longitude: -98.282464), imageName: "AcumulacionDeBasura2"),
        ProblemAnnotation(title: "Incendio", description: "Incendio en un predio ubicado en la Junta Auxiliar de San Juan Tlautla.", criticality: .alta, coordinate: CLLocationCoordinate2D(latitude: 19.08564, longitude: -98.34444), imageName: "Incendio"),
        ProblemAnnotation(title: "Tiran visceras en la via pública", description: "Tiraron vísceras de animales en la vía pública.", criticality: .alta, coordinate: CLLocationCoordinate2D(latitude: 19.076291, longitude: -98.315167), imageName: "ViscerasViaPublica"),
        ProblemAnnotation(title: "Queman de desechos y pasto", description: "Quemaron basura, llantas y pastizal en un terreno baldío.", criticality: .media, coordinate: CLLocationCoordinate2D(latitude: 19.06155, longitude: -98.32585), imageName: "QuemaDeBasura"),
        ProblemAnnotation(title: "Falta de servicios de recolección de basura", description: "Se denuncia la falta de servicios de recolección de basura.", criticality: .alta, coordinate: CLLocationCoordinate2D(latitude: 19.077682, longitude: -98.315066), imageName: "FaltaDeRecoleccion"),
        ProblemAnnotation(title: "Falta de servicios de recolección de basura", description: "Se denuncia la falta de servicios de recolección de basura.", criticality: .alta, coordinate: CLLocationCoordinate2D(latitude: 19.077682, longitude: -98.335066), imageName: "FaltaDeRecoleccion"),
        ProblemAnnotation(title: "Encharcamiento por basura", description: "La acumulación de basura cuasó un encharcamiento.", criticality: .media, coordinate: CLLocationCoordinate2D(latitude: 19.082320, longitude: -98.310234), imageName: "Encharcamiento"),
        ProblemAnnotation(title: "Acumulación de basura", description: "Los servicios de limpieza parecen superados por la magnitud del problema, dejando a nuestra comunidad en una constante lucha contra la suciedad.", criticality: .media, coordinate: CLLocationCoordinate2D(latitude: 19.071476, longitude: -98.3313807), imageName: "AcumulacionDeBasura3"),
        ProblemAnnotation(title: "Quema de pastizales", description: "Se quemaron 300 m^2 de pastizal.", criticality: .media, coordinate: CLLocationCoordinate2D(latitude: 19.071476, longitude: -98.313807), imageName: "QuemaDePastizales"),
        ProblemAnnotation(title: "Quema de pastizales", description: "Se quemaron 300 m^2 de pastizal.", criticality: .media, coordinate: CLLocationCoordinate2D(latitude: 19.071476, longitude: -98.31844), imageName: "QuemaDePastizales2"),
        ProblemAnnotation(title: "Quema de pastizales", description: "Se quemaron 700 m^2 de pastizal.", criticality: .media, coordinate: CLLocationCoordinate2D(latitude: 19.085728, longitude: -98.320373), imageName: "QuemaDePastizales3")
    ]
    
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
                    Image(systemName: "pin.fill")
                        .foregroundColor(color(for: annotation.criticality))
                        .shadow(color: .gray, radius: 5, x: 0, y: 2)
                        .onTapGesture {
                        if !annotationMode {
                            print("Annotation tapped: \(annotation)")
                            selectedAnnotation = annotation
                                showingDetails = true
                        }
                    }
                }
            }
            .onTapGesture {
                updateAnnotationAddresses()
            }
            .edgesIgnoringSafeArea(.all)
            
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
                        .tint(Color("ColorPrincipal"))
                }
                .shadow(color: .gray, radius: 5, x: 0, y: 2)
                
                if annotationMode {
                    //Button to create new annotation on user's current location
                    Button(action: {
                        
                        if locationManager.currentLocation != nil {
                            print("location nil")
                            
                            // Makew new annotation the center of the view
                            cameraPosition.center = newAnnotationCoordinate ?? CLLocationCoordinate2D(latitude: 19.04802, longitude: -98.29617)
                            
                        } else {
                            newAnnotationCoordinate = CLLocationCoordinate2D(latitude: 19.04802, longitude: -98.29617)
                            
                            // Makew new annotation the center of the view
                            cameraPosition.center = newAnnotationCoordinate ?? CLLocationCoordinate2D(latitude: 19.04802, longitude: -98.29617)
                        }
                        
                        showingInputForm = true
                        print("Button activated")
                        
                    }) {
                        Image(systemName: "eye.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50, alignment: .topTrailing)
                            .padding()
                            .tint(Color("ColorPrincipal"))
                    }
                    .shadow(color: .gray, radius: 5, x: 0, y: 2)
                }
            }
        }
        .onChange(of: tabSelection){ newSelection in
            if (newSelection == .map) {
                resetMap()
            }
            
        }
        .sheet(isPresented: $showingInputForm, content: {
            AnnotationInputView(showingInputForm: $showingInputForm, annotations: $annotations, newAnnotationCoordinate: $newAnnotationCoordinate)
        })
        
        
        .sheet(isPresented: $showingDetails, content: {
            AnnotationDetailView(annotation: $selectedAnnotation)
        })
    }
    
    private func resetMap(){
        cameraPosition = .userRegion
    }
    
    private func updateAnnotationAddresses() {
        for index in annotations.indices {
            let coordinate = annotations[index].coordinate
            coordinate.geocode { address in
                if let address = address {
                    DispatchQueue.main.async {
                        self.annotations[index].address = address
                    }
                }
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
    MapView(tabSelection: .constant(.map))
}
