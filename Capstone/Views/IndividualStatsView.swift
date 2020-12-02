//
//  IndividualStatsView.swift
//  Capstone
//
//  Created by Leo Dube on 2019-12-12.
//  Copyright © 2019 Leo Dube. All rights reserved.
//

import SwiftUI

struct IndividualStatsView: View {
    @EnvironmentObject var selectedPlayer: SelectedPlayer
    
    var body: some View {
        VStack {
            VStack {
                ZStack (alignment: .center){
                    Image("jersey")
                        .resizable()
                        .frame(width: 150, height: 150, alignment: .center)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.black, lineWidth: 2))
                    Text(selectedPlayer.player!.jerseyNumber)
                        .bold()
                        .font(.system(size: 45))
                        .foregroundColor(Color.white)
                }
                Text(selectedPlayer.player!.fullName)
                    .font(.title)
            }.padding()
            Divider()
            VStack (alignment: .leading) {
                Group {
                    HStack {
                        Text("Games:").bold()
                        Spacer()
                        Text(String(selectedPlayer.playerStats!.stats[0].splits[0].stat.games))
                            .frame(width: 75, alignment: .center)
                    }
                    HStack {
                        Text("Points:").bold()
                        Spacer()
                        Text(String(selectedPlayer.playerStats!.stats[0].splits[0].stat.points))
                            .frame(width: 75, alignment: .center)
                    }
                    HStack {
                        Text("Goals:").bold()
                        Spacer()
                        Text(String(selectedPlayer.playerStats!.stats[0].splits[0].stat.goals))
                            .frame(width: 75, alignment: .center)
                    }
                    HStack {
                        Text("Assists:").bold()
                        Spacer()
                        Text(String(selectedPlayer.playerStats!.stats[0].splits[0].stat.assists))
                            .frame(width: 75, alignment: .center)
                    }
                    HStack {
                        Text("Plus/Minus:").bold()
                        Spacer()
                        Text(String(selectedPlayer.playerStats!.stats[0].splits[0].stat.plusMinus))
                            .frame(width: 75, alignment: .center)
                    }
                    HStack {
                        Text("Shots:").bold()
                        Spacer()
                        Text(String(selectedPlayer.playerStats!.stats[0].splits[0].stat.shots))
                            .frame(width: 75, alignment: .center)
                    }
                    HStack {
                        Text("Hits:").bold()
                        Spacer()
                        Text(String(selectedPlayer.playerStats!.stats[0].splits[0].stat.hits))
                            .frame(width: 75, alignment: .center)
                    }
                    HStack {
                        Text("PIM:").bold()
                        Spacer()
                        Text(String(selectedPlayer.playerStats!.stats[0].splits[0].stat.pim))
                            .frame(width: 75, alignment: .center)
                    }
                    HStack {
                        Text("Time on ice:").bold()
                        Spacer()
                        Text(selectedPlayer.playerStats!.stats[0].splits[0].stat.timeOnIce)
                            .frame(width: 75, alignment: .center)
                    }
                }
            }.padding(40)
            Spacer()
        }
    }
}

struct IndividualStatsView_Previews: PreviewProvider {
    static let selectedPlayer = SelectedPlayer()
    static var previews: some View {
        IndividualStatsView().environmentObject(selectedPlayer)
    }
}
