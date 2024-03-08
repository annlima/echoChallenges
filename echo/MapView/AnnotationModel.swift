//
//  AnnotationModel.swift
//  echo
//
//  Created by Dicka J. Lezama on 03/03/24.
//

import Foundation
import MapKit


extension ProblemAnnotation {
    func updateAddress(completion: @escaping (String?) -> Void) {
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            guard let placemark = placemarks?.first, error == nil else {
                completion(nil)
                return
            }
            let address = [placemark.thoroughfare, placemark.subThoroughfare, placemark.locality, placemark.administrativeArea, placemark.country].compactMap { $0 }.joined(separator: ", ")
            self.address = address.isEmpty ? nil : address
            completion(self.address)
        }
    }
}


class ProblemAnnotation: Identifiable {
    var id: UUID = UUID()
    var title: String
    var description: String
    var criticality: Criticality
    var coordinate: CLLocationCoordinate2D
    var imageName: String
    var address: String?
    
    enum Criticality: String {
        case alta, media, baja
    }
    
    init(title: String, description: String, criticality: Criticality, coordinate: CLLocationCoordinate2D, imageName: String, address: String? = nil) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.criticality = criticality
        self.coordinate = coordinate
        self.imageName = imageName
        self.address = address
    }
}





