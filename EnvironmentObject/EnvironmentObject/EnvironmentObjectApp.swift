//
//  EnvironmentObjectApp.swift
//  EnvironmentObject
//
//  Created by Aaron Lee on 2020-12-18.
//

import SwiftUI

@main
struct EnvironmentObjectApp: App {
    
    let myObj = MyObject()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(myObj)
        }
    }
}
