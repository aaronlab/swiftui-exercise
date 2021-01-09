//
//  View+Extension.swift
//  KoreanLotteryApp
//
//  Created by Aaron Lee on 2020-11-15.
//

import SwiftUI
import UIKit

extension View {
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
