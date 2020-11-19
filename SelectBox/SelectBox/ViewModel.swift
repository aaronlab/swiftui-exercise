//
//  ViewModel.swift
//  SelectBox
//
//  Created by Aaron Lee on 2020-11-19.
//

import Foundation
import Combine

final class ViewModel: ObservableObject {
    // MARK: - PROPERTIES
    
    var options: [Option]?
    @Published var selectedOption: Option?
    
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - METHODS
    
    func loadOptions() {
        self.options = Option.placeHolder()
        self.selectedOption = options?[0]
    }
    
}
