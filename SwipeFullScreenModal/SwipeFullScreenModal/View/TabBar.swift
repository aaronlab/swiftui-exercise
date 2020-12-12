//
//  TabBar.swift
//  SwipeFullScreenModal
//
//  Created by Aaron Lee on 2020-12-12.
//

import SwiftUI

struct TabBar: View {
    
    @Namespace var animation
    @StateObject var detailObject = DetailViewModel()
    
    var body: some View {
        
        ZStack {
            TabView {
                
                Today(animation: animation)
                    .environmentObject(detailObject)
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
            } //: T
            
            .opacity(detailObject.show ? 0 : 1)
            
            if detailObject.show {
                
                Detail(detail: detailObject, animation: animation)
            }
        } //: Z
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
