//
//  ViewModel.swift
//  SelectBox
//
//  Created by Aaron Lee on 2020-11-19.
//

import Foundation

final class ViewModel: ObservableObject {
    // MARK: - PROPERTIES
    
    var options: [Option]?
    @Published var selectedOption: Option?
    
    // MARK: - METHODS
    
    func loadOptions() {
        self.options = Option.placeHolder()
        self.selectedOption = options?[0]
    }
    
}
