//
//  TeamView.swift
//  Capstone
//
//  Created by Leo Dube on 2019-12-11.
//  Copyright © 2019 Leo Dube. All rights reserved.
//

import SwiftUI

struct TeamView: View {
    @ObservedObject var teamModel = TeamViewModel()
    
    var body: some View {
        VStack {
            Text("Header")
            Divider()
            Spacer()
            NavigationView {
                Text("Left")
                Text("Right")
            }
       
        }
    }
}

struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        TeamView()
    }
}
