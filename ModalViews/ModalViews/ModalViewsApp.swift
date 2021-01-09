//
//  ModalViewsApp.swift
//  ModalViews
//
//  Created by Aaron Lee on 2020-11-11.
//

import SwiftUI
import PartialSheet

@main
struct ModalViewsApp: App {
    
    let sheetManager = PartialSheetManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(sheetManager)
        }
    }
}
