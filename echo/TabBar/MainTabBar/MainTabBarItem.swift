//
//  MainTabBarItem.swift
//  echo
//
//  Created by Dicka J. Lezama on 25/02/24.
//

import Foundation
import SwiftUI

enum MainTabBarItem: Hashable { //items
    case  challenge, feed, profile
    
    var imageName: String {
        switch self {
        case .profile: return "person"
        case .feed: return "square.text.square"
        case .challenge: return "checkmark.square"
        }
    }
    
    var selectedImage: String {
        switch self {
        case .profile: return "person.fill"
        case .feed: return "square.text.square.fill"
        case .challenge: return "checkmark.square.fill"
        }
    }
    
    var buttonText: String {
        switch self {
        case .profile: return "Perfil"
        case .feed: return "Muro"
        case .challenge: return "Retos"
        }
    }
    
    var color1: Color {
        switch self {
        case .profile: return Color.colorPrincipal
        case .feed: return Color.colorPrincipal
        case .challenge: return Color.colorPrincipal
        }
    }
}
