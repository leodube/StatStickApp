//
//  StatsViewModel.swift
//  Capstone
//
//  Created by Leo Dube on 2019-12-12.
//  Copyright © 2019 Leo Dube. All rights reserved.
//

// POSSIBLY UNUSED
import SwiftUI

final class StatsViewModel: ObservableObject {
    var playerID: String
    @Published var statsWrapper: StatsWrapper?
    
    init() {
        self.playerID = String( RosterPlayer.example.id)
        fetchStatsInfo()
    }
    
    func update(id: String) {
        self.playerID = id
        fetchStatsInfo()
    }
    
    private func fetchStatsInfo() {
        WebService().getStatsInfo(playerID: self.playerID) {
            self.statsWrapper = $0
        }
    }
}
