//
//  TeamViewModel.swift
//  Capstone
//
//  Created by Leo Dube on 2019-12-11.
//  Copyright © 2019 Leo Dube. All rights reserved.
//

import SwiftUI

final class TeamViewModel: ObservableObject {
    @Published var teamWrapper: TeamWrapper?
    
    init(){
        fetchTeamInfo()
    }
    
    private func fetchTeamInfo() {
        WebService().getTeamInfo {
            self.teamWrapper = $0
        }
    }
}
