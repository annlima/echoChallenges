//
//  ChallengeBaseClass.swift
//  echo
//
//  Created by Dicka J. Lezama on 24/02/24.
//

import Foundation
import SwiftUI

class BaseChallenge : PChallenge {
    var points: Int
    var id: String
    var name: String
    var description: String
    var startDate: Date
    var duration: ChallengeDuration
    
    //Calculate endDate based on duration
    var endDate: Date {
        switch duration {
        case .daily:
            return Calendar.current.date(byAdding: .day, value: 1, to: startDate)!
        case .weekly:
            return Calendar.current.date(byAdding: .weekOfYear, value: 1, to: startDate)!

        case .monthly:
            return Calendar.current.date(byAdding: .month, value: 1, to: startDate)!
        }
    }
    
    init(id: String, name: String, description: String, startDate: Date, duration: ChallengeDuration, points: Int) {
        self.id = id
        self.name = name
        self.description = description
        self.startDate = startDate
        self.duration = duration
        self.points = points
    }
    
    func startChallenge() {
        print("Starting challenge: \(description)")
        
    }
    
    func endChallenge() {
        print("Ending challenge: \(description)") //placeholder
    }
    
    /*
     func generateBadge() -> Badge {
         let colors: [Color] = [.red, .green, .blue, .yellow, .orange, .purple]
         let backgroundColor = colors.randomElement() ?? .black
         let symbolColor = colors.randomElement() ?? .white
         
         return Badge(symbol: BadgeSymbol(), backgroundColor: backgroundColor, symbolColor: symbolColor)
     }
     */
    
}
