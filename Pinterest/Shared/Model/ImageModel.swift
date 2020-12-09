//
//  ImageModel.swift
//  Pinterest
//
//  Created by Aaron Lee on 2020-12-09.
//

import SwiftUI

struct ImageModel: Codable, Identifiable {
    var id: String
    var download_url: String
    var onHover: Bool?
}
