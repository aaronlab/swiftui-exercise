//
//  SliderMenuAppApp.swift
//  SliderMenuApp
//
//  Created by Aaron Lee on 2020-11-06.
//

import SwiftUI

@main
struct SliderMenuAppApp: App {
    
    init() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
