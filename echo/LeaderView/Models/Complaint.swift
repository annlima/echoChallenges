//
//  Complaint.swift
//  echo
//
//  Created by Azuany Mila Cerón on 07/03/24.
//

import SwiftUI
import MapKit


struct Complaint: Identifiable {
    let id = UUID()
    let title: String
    let text: String
    let photo: Image
    let category: String
    let location: CLLocation
}


extension Complaint {
    
    static var test: Complaint {
        Complaint(title: "Basura acumulada",
                  text: "Hay basura acumulada afuera de una casa del centro",
                  photo: Image(.tendency2),
                  category: "low",
                  location: CLLocation(latitude: 19.052079853258167, longitude: -98.28510777831497)
            
        )
    }
    
    static var test2: Complaint {
        Complaint(title: "Incendio en cerro",
                  text: "Están quemando pasto en el cerro",
                  photo: Image(.quemaCerroZ),
                  category: "low",
                  location: CLLocation(latitude: 19.058291157581635, longitude: -98.2958536187182)
            
        )
    }
    
    static var test3: Complaint {
        Complaint(title: "Socavón",
                  text: "Hay un socavón cerca de la carretera",
                  photo: Image(.socavon),
                  category: "low",
                  location: CLLocation(latitude: 19.058291157581635, longitude: -98.2958536187182)
            
        )
    }
    
    static var none: Complaint {
        Complaint(title: "No hay denuncias aún",  text: ":(", photo: Image(systemName: "questionmark.app.dashed"), category: "low", location: CLLocation(latitude: 37.785834, longitude: -122.406417)
        )
    }
}
