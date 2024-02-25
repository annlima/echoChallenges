//
//  MainTabBarItem.swift
//  echo
//
//  Created by Dicka J. Lezama on 25/02/24.
//

import Foundation
import SwiftUI

enum MainTabBarItem: Hashable {
    case profile, people, feed, chat
    
    var imageName: String {
        switch self {
        case .profile: return "person"
        case .people: return "person.badge.plus"
        case .feed: return "square.text.square"
        case .chat: return "bubble.left"
        }
    }
    
    var selectedImage: String {
        switch self {
        case .profile: return "person.fill"
        case .people: return "person.badge.plus.fill"
        case .feed: return "square.text.square.fill"
        case .chat: return "bubble.left.fill"
        }
    }
    
    var buttonText: String {
        switch self {
        case .profile: return "Profile"
        case .people: return "People"
        case .feed: return "Feed"
        case .chat: return "Chat"
        }
    }
    
    var color1: Color {
        switch self {
        case .profile: return Color.customPurple
        case .people: return Color.customPurple
        case .feed: return Color.customPurple
        case .chat: return Color.customPurple
        }
    }
}
