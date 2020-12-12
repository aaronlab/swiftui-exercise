//
//  TodayItem.swift
//  SwipeFullScreenModal
//
//  Created by Aaron Lee on 2020-12-12.
//

import Foundation

struct TodayItem: Identifiable {
    let id = UUID().uuidString
    let title: String
    let category: String
    let overlay: String
    let contentImage: String
    let logo: String
}

var items = [
    TodayItem(title: "Froza Street", category: "Ultimate Street Racing Game", overlay: "GAME OF THE DAY", contentImage: "b1", logo: "l1"),
    TodayItem(title: "Roblox", category: "Adventure", overlay: "Li Nas X Performs In Roblox", contentImage: "b2", logo: "l2 ")
]
