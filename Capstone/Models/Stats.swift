//
//  Stats.swift
//  Capstone
//
//  Created by Leo Dube on 2019-12-12.
//  Copyright © 2019 Leo Dube. All rights reserved.
//

import SwiftUI

struct StatsWrapper: Codable {
    var copyright: String
    var stats: [Stats]
}

struct Stats: Codable {
    var type: StatsType
    var splits: [Splits]
}

struct StatsType: Codable {
    var displayName: String
}

struct Splits: Codable {
    var season: String
    var stat: Stat
}

struct Stat: Codable {
    var timeOnIce: String
    var assists: Int
    var goals: Int
    var pim: Int
    var shots: Int
    var games: Int
    var hits: Int
    var powerPlayGoals: Int
    var powerPlayPoints: Int
    var powerPlayTimeOnIce: String
    var evenTimeOnIce: String
    var penaltyMinutes: String
    var faceOffPct: Float
    var shotPct: Float
    var gameWinningGoals: Int
    var overTimeGoals: Int
    var shortHandedGoals: Int
    var shortHandedPoints: Int
    var shortHandedTimeOnIce: String
    var blocked: Int
    var plusMinus: Int
    var points: Int
    var shifts: Int
    var timeOnIcePerGame: String
    var evenTimeOnIcePerGame: String
    var shortHandedTimeOnIcePerGame: String
    var powerPlayTimeOnIcePerGame: String
}
