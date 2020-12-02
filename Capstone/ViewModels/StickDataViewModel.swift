//
//  StickDataViewModel.swift
//  Capstone
//
//  Created by Leo Dube on 2020-02-13.
//  Copyright © 2020 Leo Dube. All rights reserved.
//

import Foundation
import SwiftUI

final class StickDataViewModel: ObservableObject {
    var time: String
    var action: StickAction?
    @Published var actionHistory: ActionHistory?
    
    init() {
        self.time = "Start"
        self.actionHistory = ActionHistory.example
    }
    
    func update() {
        self.time = getTimeStamp()
        actionHistory?.actions.append(generateDemoAction(t: time))
        // fetchStickDataInfo()
        // action!.time = getTimeStamp()
        // actionHistory?.actions.append(action!)
    }
    
    func getTimeStamp() -> String{
        let formatter = DateFormatter()
        formatter.timeStyle = .long
        let dateString = formatter.string(from: Date())
        return dateString
    }
    
    func generateDemoAction(t: String) -> StickAction {
        let shots = ["Slap Shot", "Wrist Shot", "Snap Shot", "Stick Handling", "Pass", "On Bench", "Skating"]
        let rand = Int.random(in: 0...6)
        
        let demoAction = StickAction(action: [Action(action_id: rand, action: shots[rand])], time: t)
        return demoAction
    }
    
    private func fetchStickDataInfo() {
        WebService().getStickDataInfo() {
            self.action = $0
        }
    }
}
