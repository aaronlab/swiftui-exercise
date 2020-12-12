//
//  DetailViewModel.swift
//  SwipeFullScreenModal
//
//  Created by Aaron Lee on 2020-12-12.
//

import Foundation

class DetailViewModel: ObservableObject {
    
    @Published var selectedItem = TodayItem(title: "", category: "", overlay: "", contentImage: "", logo: "")
    
    @Published var show = false
    
}
