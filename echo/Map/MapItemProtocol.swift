//
//  MapItemProtocol.swift
//  echo
//
//  Created by Dicka J. Lezama on 02/03/24.
//

import Foundation
import MapKit

enum Severity {
    case high
    case medium
    case low
}

protocol PMapItem {
    var id: String { get }
    var name: String { get }
    var description: String { get }
    var severity: Severity { get }
    var location: CLLocationCoordinate2D { get }
}
