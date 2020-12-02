//
//  Timer.swift
//  Capstone
//
//  Created by Leo Dube on 2020-02-13.
//  Copyright © 2020 Leo Dube. All rights reserved.
//

import SwiftUI
import Combine

class TimerWrapper : ObservableObject {
    let willChange = PassthroughSubject<TimerWrapper, Never>()
    
    var timer : Timer!
    func start(withTimeInterval interval: Double) {
        self.timer?.invalidate()
        self.timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
            self.willChange.send(self)
        }
    }
}
