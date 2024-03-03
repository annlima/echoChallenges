//
//  CustomAnnotation.swift
//  echo
//
//  Created by Dicka J. Lezama on 29/02/24.
//

import Foundation
import MapKit

class CustomAnnotation: NSObject, MKAnnotation, Identifiable {
    let id: String
    dynamic var coordinate: CLLocationCoordinate2D
    var severity: Severity

    init(id: String, coordinate: CLLocationCoordinate2D, severity: Severity) {
        self.id = id
        self.coordinate = coordinate
        self.severity = severity
    }
}
