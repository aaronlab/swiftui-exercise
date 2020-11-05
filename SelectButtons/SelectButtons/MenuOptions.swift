//
//  MenuOptions.swift
//  SelectButtons
//
//  Created by Aaron Lee on 2020-11-05.
//

import Foundation

struct MenuOptions {
    let options: [MenuOption]
}

struct MenuOption {
    let name: OptionType
    let value: String
}

extension MenuOptions {
    
    static func placeholders() -> [MenuOption] {
        return [
            MenuOption(name: .size, value: Sizes.small.rawValue),
            MenuOption(name: .size, value: Sizes.medium.rawValue),
            MenuOption(name: .size, value: Sizes.large.rawValue),
            MenuOption(name: .size, value: Sizes.xLarge.rawValue),
            MenuOption(name: .size, value: Sizes.xl2.rawValue),
            MenuOption(name: .color, value: Colors.red.rawValue),
            MenuOption(name: .color, value: Colors.green.rawValue),
            MenuOption(name: .color, value: Colors.blue.rawValue)
        ]
    }
    
}

enum OptionType {
    case size, color
}

enum Sizes: String {
    case small = "S"
    case medium = "M"
    case large = "L"
    case xLarge = "XL"
    case xl2 = "2XL"
}

enum Colors: String {
    case red = "Red"
    case green = "Green"
    case blue = "Blue"
}
