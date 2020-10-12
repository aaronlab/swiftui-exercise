//
//  ContentView.swift
//  Hiking
//
//  Created by Aaron Lee on 2020-10-12.
//

import SwiftUI

struct ContentView: View {
    
    let hikes = Hike.all()
    
    var body: some View {
        
        List(self.hikes, id: \.name) { hike in
            Text(hike.name)
                .font(.title)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
