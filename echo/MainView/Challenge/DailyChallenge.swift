//
//  DailyChallenge.swift
//  echo
//
//  Created by Dicka J. Lezama on 24/02/24.
//

import Foundation

class DailyChallenge: BaseChallenge, ObservableObject {
    init(id: String, name: String, description: String, startDate: Date, points: Int) {
        super.init(id: id, name: name, description: description, startDate: startDate, duration: .daily, points: points)
    }
        
    override func startChallenge() {
        self.description = "Challenge Started: \(description)"
        // Further implementation
    }
        
    // Implement endChallenge if needed
    override func endChallenge() {
        
    }
    
   
    
}



