//
//  MapView.swift
//  echo
//
//  Created by Dicka J. Lezama on 29/02/24.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static var userLocation: CLLocationCoordinate2D {
        return.init(latitude: 19.04802, longitude: -98.29617)
    }
}

extension MKCoordinateRegion {
    
}


struct MapView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    MapView()
}
