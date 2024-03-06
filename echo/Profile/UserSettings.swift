//
//  UserSettings.swift
//  echo
//
//  Created by Dicka J. Lezama on 05/03/24.
//

import Foundation
import MapKit

class UserSettings: ObservableObject {
    @Published var myPlaceLocation: CLLocationCoordinate2D

    init(myPlaceLocation: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 19.04802, longitude: -98.29617)) {
        self.myPlaceLocation = myPlaceLocation
    }
}
