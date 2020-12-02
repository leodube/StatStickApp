//
//  DevView.swift
//  Capstone
//
//  Created by Leo Dube on 2019-12-11.
//  Copyright © 2019 Leo Dube. All rights reserved.
//

import SwiftUI

struct DevView: View {
    @EnvironmentObject var stickData: StickDataViewModel
    
    @State var currentDate = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            VStack {
                ZStack (alignment: .center){
                    Image("jersey")
                        .resizable()
                        .frame(width: 150, height: 150, alignment: .center)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.black, lineWidth: 2))
                    Text("00")
                        .bold()
                        .font(.system(size: 45))
                        .foregroundColor(Color.white)
                    }
                Text("Player Name")
                    .font(.title)
                //            HStack {
                //                Text("Time On Ice:      ").bold()
                //                Text("API stuff")
                //                    .frame(width: 75, alignment: .center)
                //            }
            }.padding()
    
            VStack(alignment: .leading){
                Text("Action Log")
                    .font(.title)
                    .padding(20)
                List {
                    ForEach(stickData.actionHistory?.actions ?? ActionHistory.example.actions) { action in
                        Text(action.time + "     Action Type: " + action.action[0].action)
                    }
                }
                .onReceive(timer) { input in
                    self.stickData.update()
                }
            }
        }
    }
}

struct DevView_Previews: PreviewProvider {
    static var previews: some View {
        DevView()
    }
}
