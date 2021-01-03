//
//  HomeView.swift
//  SQLiteExample
//
//  Created by Aaron Lee on 2021-01-03.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            
            VStack(alignment: .leading, spacing: 0) {
                
                NavigationLink("Add", destination: AddView())
                
                List {
                    Text("Item 1")
                }
            }
            .navigationBarTitle("Home View", displayMode: .inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
