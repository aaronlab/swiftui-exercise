//
//  ContentViewModel.swift
//  DrawerExample
//
//  Created by Aaron Lee on 2020-12-15.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    var destination = SecondView()
    @Published var navigationStatus: NavigationStatus? = .ready
    
}
