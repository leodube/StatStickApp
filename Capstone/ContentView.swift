//
//  ContentView.swift
//  Capstone
//
//  Created by Leo Dube on 2019-12-11.
//  Copyright © 2019 Leo Dube. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var selectedView = 0
    @EnvironmentObject var timerWrapper: TimerWrapper
    var selectedPlayer = SelectedPlayer()
    var stickData = StickDataViewModel()
    
    init() {
        self.stickData.update()
    }
    
    var body: some View {
        TabView(selection: $selectedView) {
            DevView()
            .environmentObject(stickData)
                .tabItem {
                    Image(systemName: "perspective")
                    Text("Stick Stats")
            }.tag(0)
            PlayerView()
                .environmentObject(selectedPlayer)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Players")
            }.tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
