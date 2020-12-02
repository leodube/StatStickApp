//
//  PlayerListView.swift
//  Capstone
//
//  Created by Leo Dube on 2019-12-11.
//  Copyright © 2019 Leo Dube. All rights reserved.
//

import SwiftUI

struct PlayerListView: View {
    var roster_APIReturn: [RosterPlayer_APIReturn]
    var roster: Roster?
    @EnvironmentObject var selectedPlayer: SelectedPlayer
    
    init(roster: [RosterPlayer_APIReturn]) {
        self.roster_APIReturn = roster
        parseRosterInfo()
    }
        
    var body: some View {
        List {
            ForEach(roster?.positions ?? Roster.example.positions) { position in
                if (position.type == "Goalie") {
                    // pass
                } else {
                    Section(header: Text(position.type)) {
                        ForEach(position.players) { player in
                            Button (player.fullName) {
                                self.selectedPlayer.set(selected: player, selectedID: player.id)
                            }
                        }
                    }
                }
            }
        }
        .navigationBarTitle("Players")
    }
    
    private mutating func parseRosterInfo() {
        var newRoster = Roster(positions: [])
        var newPlayer: RosterPlayer
        var newPosition: RosterPosition
        var index: Int
        
        for p in self.roster_APIReturn {
            newPlayer = RosterPlayer(id: p.person.id, fullName: p.person.fullName, link: p.person.link, jerseyNumber: p.jerseyNumber, positionCode: p.position.code, positionName: p.position.name, positionAbbreviation: p.position.abbreviation)
            
            if newRoster.positions.contains(where: {$0.type == p.position.type}) {
                index = newRoster.positions.firstIndex(where: {$0.type == p.position.type})!
                newRoster.positions[index].players.append(newPlayer)
            } else {
                newPosition = RosterPosition(type: p.position.type, players: [])
                newRoster.positions.append(newPosition)
                index = newRoster.positions.firstIndex(where: {$0.type == p.position.type})!
                newRoster.positions[index].players.append(newPlayer)
            }
        }
        self.roster = newRoster
    }
}

struct PlayerListView_Previews: PreviewProvider {
    static let selectedPlayer = SelectedPlayer()
    static var previews: some View {
        PlayerListView(roster: [RosterPlayer_APIReturn.example]).environmentObject(selectedPlayer)
    }
}

