//
//  PlayerView.swift
//  Capstone
//
//  Created by Leo Dube on 2019-12-12.
//  Copyright © 2019 Leo Dube. All rights reserved.
//

import SwiftUI

struct PlayerView: View {
    @ObservedObject var rosterModel = RosterViewModel()
    
    var body: some View {
        NavigationView {
            PlayerListView(roster: rosterModel.rosterWrapper_APIReturn!.roster)
            IndividualStatsView()
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
