//
//  Roster_APIReturn.swift
//  Capstone
//
//  Created by Leo Dube on 2019-12-12.
//  Copyright © 2019 Leo Dube. All rights reserved.
//

import SwiftUI

struct RosterWrapper_APIReturn: Codable {
    var copyright: String
    var roster: [RosterPlayer_APIReturn]
    
    #if DEBUG
    static let example = RosterWrapper_APIReturn(copyright: "copyright text here", roster:[RosterPlayer_APIReturn.example])
    #endif
}

struct RosterPlayer_APIReturn: Codable, Identifiable {
    let id = UUID()
    var person: RosterPerson_APIReturn
    var jerseyNumber: String
    var position: RosterPosition_APIReturn
    
    #if DEBUG
    static let example = RosterPlayer_APIReturn(person: RosterPerson_APIReturn(id: 8479318, fullName: "Auston Matthews", link: "/api/v1/people/8479318"), jerseyNumber: "34", position: RosterPosition_APIReturn(code: "C", name: "Center", type: "Forward", abbreviation: "C"))
    #endif
}

struct RosterPerson_APIReturn: Codable, Identifiable {
    var id: Int
    var fullName: String
    var link: String
}

struct RosterPosition_APIReturn: Codable {
    var code: String
    var name: String
    var type: String
    var abbreviation: String
}

