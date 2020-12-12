//
//  TabBar.swift
//  SwipeFullScreenModal
//
//  Created by Aaron Lee on 2020-12-12.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        
        TabView {
            
            Today()
                .tabItem {
                    
                    Image("today")
                        .renderingMode(.template)
                    
                    Text("Today")
                }
            
            Text("Games")
                .tabItem {
                    
                    Image("games")
                        .renderingMode(.template)
                    
                    Text("Games")
                }
            
            Text("Apps")
                .tabItem {
                    
                    Image("apps")
                        .renderingMode(.template)
                    
                    Text("Apps")
                }
            
            Text("Search")
                .tabItem {
                    
                    Image("search")
                        .renderingMode(.template)
                    
                    Text("Search")
                }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
