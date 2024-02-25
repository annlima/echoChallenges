//
//  ChallengeProtocol.swift
//  echo
//
//  Created by Dicka J. Lezama on 24/02/24.
//

import Foundation

// protocol --> interface

enum ChallengeDuration {
    case daily
    case weekly
    case monthly
}

/*
 enum Categories {
    case ...
 }
 */

protocol PChallenge: AnyObject {
    var id: String { get }
    var name: String { get }
    var description: String { get }
    //var category: String { get }
    var startDate: Date { get }
    var duration: ChallengeDuration { get }
    var endDate: Date { get }
    var points: Int { get }
    // var image
    //var badge: PBadge { get set }
    
    
    func startChallenge()
    func endChallenge()
}


