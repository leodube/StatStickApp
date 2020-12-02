//
//  StickData.swift
//  Capstone
//
//  Created by Leo Dube on 2020-02-13.
//  Copyright © 2020 Leo Dube. All rights reserved.
//

import Foundation

struct ActionHistory: Codable {
    var actions: [StickAction]
    
    #if DEBUG
    static let example = ActionHistory(actions: [StickAction.example])
    #endif
}

struct StickAction: Codable, Identifiable {
    var id = UUID()
    var action: [Action]
    var time: String
    
    #if DEBUG
    static let example = StickAction(action: [Action(action_id: 0, action: "Slap Shot")], time: "17:34:44")
    #endif
}

struct Action: Codable, Identifiable {
    var id = UUID()
    var action_id: Int
    var action: String
}


