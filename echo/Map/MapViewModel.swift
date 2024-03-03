//  MapViewModel.swift
//  echo
//
//  Created by Dicka J. Lezama on 29/02/24.
//

import Foundation
import MapKit

class MapViewModel: ObservableObject {
    @Published var annotations: [CustomAnnotation] = []
    
    
    //Function to add a new annotation
    func addAnnotation(coordinate: CLLocationCoordinate2D, severity: Severity) {
        let newAnnotation = CustomAnnotation(id: UUID().uuidString, coordinate: coordinate, severity: severity)
        DispatchQueue.main.async {
            self.annotations.append(newAnnotation)
        }
    }

}
