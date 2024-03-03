//
//  AnnotationModel.swift
//  echo
//
//  Created by Dicka J. Lezama on 03/03/24.
//

import Foundation
import MapKit



struct ProblemAnnotation: Identifiable {
    var id: UUID = UUID()
    var title: String
    var description: String
    var criticality: Criticality
    var coordinate: CLLocationCoordinate2D
    
    enum Criticality: String {
        case high, medium, low
    }
    
    init(title: String, description: String, criticality: Criticality, coordinate: CLLocationCoordinate2D) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.criticality = criticality
        self.coordinate = coordinate
    }
    
}





