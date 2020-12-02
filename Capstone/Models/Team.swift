//
//  Team.swift
//  Capstone
//
//  Created by Leo Dube on 2019-12-11.
//  Copyright © 2019 Leo Dube. All rights reserved.
//

import SwiftUI

struct TeamWrapper: Codable {
    var copyright: String
    var teams: [Team]
}

struct Team: Codable, Identifiable {
    var id: Int
    var name: String
    var link: String
    var venue: TeamVenue
    var abbreviation: String
    var teamName: String
    var locationName: String
    var firstYearOfPlay: String
    var division: TeamDivision
    var conference: TeamConference
    var franchise: TeamFranchise
    var shortName: String
    var officialSiteUrl: String
    var franchiseId: Int
    var active: Bool
}

struct TeamVenue: Codable {
    var name: String
    var link: String
    var city: String
    var timeZone: TeamTimeZone
}

struct TeamTimeZone: Codable {
    var id: String
    var offset: Int
    var tz: String
}

struct TeamDivision: Codable {
    var id: Int
    var name: String
    var nameShort: String
    var link: String
    var abbreviation: String
}

struct TeamConference: Codable {
    var id: Int
    var name: String
    var link: String
}

struct TeamFranchise: Codable {
    var franchiseId: Int
    var teamName: String
    var link: String
}
