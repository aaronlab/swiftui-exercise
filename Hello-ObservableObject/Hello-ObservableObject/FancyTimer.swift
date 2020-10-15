//
//  FancyTimer.swift
//  Hello-ObservableObject
//
//  Created by Aaron Lee on 2020-10-15.
//

import SwiftUI
import Combine

class FancyTimer: ObservableObject {

    @Published var value: Int = 0

    init() {

        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.value += 1
        }

    }

}
