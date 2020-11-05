//
//  ViewModel.swift
//  SelectButtons
//
//  Created by Aaron Lee on 2020-11-05.
//

import Foundation

final class ViewModel: ObservableObject {
    
    var options = ["S", "M", "L", "XL", "2XL"]
    @Published var selectedOptions = ""
    
    init() {
        self.selectedOptions = options[0]
    }
    
}
