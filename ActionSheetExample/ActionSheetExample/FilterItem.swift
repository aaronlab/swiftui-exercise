//
//  FilterItem.swift
//  ActionSheetExample
//
//  Created by Aaron Lee on 2020-11-07.
//

import Foundation

struct FilterItem: Identifiable {
    var id = UUID().uuidString
    var title: String
    var checked: Bool
}
