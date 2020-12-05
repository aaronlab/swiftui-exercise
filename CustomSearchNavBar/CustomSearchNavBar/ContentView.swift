//
//  ContentView.swift
//  CustomSearchNavBar
//
//  Created by Aaron Lee on 2020-12-05.
//

import SwiftUI

struct ContentView: View {
    
    @State var filteredItems = AppItem.placeholder()
    
    var body: some View {
        CustomNavigationView(view: AnyView(Home(filteredItems: $filteredItems)),
                             placeHolder: "Apps, Games",
                             largeTitle: true,
                             title: "Aaron Lab",
                             onSearch: { value in
                                if value != "" {
                                    self.filteredItems = AppItem.placeholder().filter { $0.name.lowercased().contains(value.lowercased()) }
                                } else {
                                    self.filteredItems = AppItem.placeholder()
                                }
                             }, onCancel: {
                                self.filteredItems = AppItem.placeholder()
                             })
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
