//
//  RosterViewModel.swift
//  Capstone
//
//  Created by Leo Dube on 2019-12-11.
//  Copyright © 2019 Leo Dube. All rights reserved.
//

import SwiftUI

final class RosterViewModel: ObservableObject {
    @Published var rosterWrapper_APIReturn: RosterWrapper_APIReturn?
    
    init() {
        fetchRosterInfo()
    }
    
    func fetchRosterInfo(){
        WebService().getRosterInfo {
            self.rosterWrapper_APIReturn = $0
        }
    }
}
