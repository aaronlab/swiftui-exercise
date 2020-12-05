//
//  AppItem.swift
//  CustomSearchNavBar
//
//  Created by Aaron Lee on 2020-12-05.
//

import Foundation

struct AppItem: Identifiable {
    
    var id = UUID().uuidString
    
    var name: String
    
    var source: String = "Apple"
    
}

extension AppItem {
    
    static func placeholder() -> [AppItem] {
        return [
            AppItem(name: "App Store"),
            AppItem(name: "Calculator"),
            AppItem(name: "Calendar"),
            AppItem(name: "Camera"),
            AppItem(name: "Clock"),
            AppItem(name: "Facetime"),
            AppItem(name: "Health"),
            AppItem(name: "Mail"),
            AppItem(name: "Maps"),
            AppItem(name: "Messages"),
            AppItem(name: "News"),
            AppItem(name: "Phone"),
            AppItem(name: "Photos"),
            AppItem(name: "Safari"),
            AppItem(name: "Settings"),
            AppItem(name: "Stocks"),
            AppItem(name: "Wallet"),
            AppItem(name: "Weather")
        ]
    }
    
}
