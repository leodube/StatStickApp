//
//  Roster.swift
//  Capstone
//
//  Created by Leo Dube on 2019-12-11.
//  Copyright © 2019 Leo Dube. All rights reserved.
//

import SwiftUI

struct Roster: Codable {
    var positions: [RosterPosition]
    
    #if DEBUG
    static let example = Roster(positions: [RosterPosition.example])
    #endif
}

struct RosterPosition: Codable, Identifiable {
    var id = UUID()
    var type: String
    var players: [RosterPlayer]
    
    #if DEBUG
    static let example = RosterPosition(type: "Forward", players: [RosterPlayer.example])
    #endif
}

struct RosterPlayer: Codable, Identifiable {
    var id: Int
    var fullName: String
    var link: String
    var jerseyNumber: String
    var positionCode: String
    var positionName: String
    var positionAbbreviation: String
    
    #if DEBUG
    static let example = RosterPlayer(id: 8479318, fullName: "Auston Matthews", link: "/api/v1/people/8479318", jerseyNumber: "34", positionCode: "C", positionName: "Center", positionAbbreviation: "C")
    #endif
}
