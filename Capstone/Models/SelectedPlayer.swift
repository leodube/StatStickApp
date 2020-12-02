//
//  SelectedPlayer.swift
//  Capstone
//
//  Created by Leo Dube on 2019-12-12.
//  Copyright © 2019 Leo Dube. All rights reserved.
//

import SwiftUI

class SelectedPlayer: ObservableObject {
    @Published var player: RosterPlayer?
    @Published var playerStats: StatsWrapper?
    var playerID: String
    
    init() {
        self.player = RosterPlayer.example
        self.playerID = String( RosterPlayer.example.id)
        fetchStatsInfo()
    }
    
    func set(selected: RosterPlayer, selectedID: Int) {
        self.player = selected
        self.playerID = String(selectedID)
        fetchStatsInfo()
    }
    
    private func fetchStatsInfo() {
        WebService().getStatsInfo(playerID: self.playerID) {
            self.playerStats = $0
        }
    }
}
