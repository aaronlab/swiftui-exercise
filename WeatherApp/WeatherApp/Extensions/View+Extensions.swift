//
//  View+Extension.swift
//  WeatherApp
//
//  Created by Aaron Lee on 2020-12-07.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
