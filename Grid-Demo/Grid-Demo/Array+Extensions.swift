//
//  Array+Extensions.swift
//  Grid-Demo
//
//  Created by Aaron Lee on 2020-10-13.
//

import Foundation

extension Array {
    
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
    
}
