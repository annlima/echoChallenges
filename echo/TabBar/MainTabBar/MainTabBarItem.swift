//
//  MainTabBarItem.swift
//  echo
//
//  Created by Dicka J. Lezama on 25/02/24.
//

import Foundation
import SwiftUI

enum MainTabBarItem: Hashable { //items
    case  map, complaints, profile, leader, ranking
    
    var imageName: String {
        switch self {
            case .profile: return "person"
            case .complaints: return "eye"
            case .map: return "map"
            case .leader: return "person.badge.shield.checkmark"
            case .ranking: return "medal"
        }
    }
    
    var selectedImage: String {
        switch self {
            case .profile: return "person.fill"
            case .complaints: return "eye.fill"
            case .map: return "map.fill"
            case .leader: return "person.badge.shield.checkmark.fill"
            case .ranking: return "medal.fill"
        
        }
    }
    
    var buttonText: String {
        switch self {
            case .profile: return "Perfil"
            case .complaints: return "Denuncias"
            case .map: return "Mapa"
            case .leader: return "Líder"
            case .ranking: return "Ranking"
            
        }
    }
    
    var color1: Color {
        switch self {
            case .profile: return Color.colorPrincipal
            case .complaints: return Color.colorPrincipal
            case .map: return Color.colorPrincipal
            case .leader: return Color.colorPrincipal
            case .ranking: return Color.colorPrincipal
        }
    }
}
