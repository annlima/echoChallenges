//
//  BadgeProtocol.swift
//  echo
//
//  Created by Dicka J. Lezama on 24/02/24.
//

import Foundation

/*
 protocol Challenge: AnyObject {
     var id: String { get }
     var name: String { get }
     var description: String { get }
     //var category: String { get }
     var startDate: Date { get }
     var duration: ChallengeDuration { get }
     var endDate: Date { get }
     var points: Int { get }
     // var image
     
     
     func startChallenge()
     func endChallenge()
 }
 */

protocol PBadge: AnyObject {
    var id: String { get }
    var challengeID: String { get }
    // include a var that tells us if the user has earned it
    // var earned: Bool { get }
}
