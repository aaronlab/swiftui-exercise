//
//  Home.swift
//  Pinterest (iOS)
//
//  Created by Aaron Lee on 2020-12-08.
//

import SwiftUI

struct Home: View {
    
    var window = NSScreen.main?.visibleFrame
    @State var selected = "Home"
    @Namespace var animation
    
    var body: some View {
        HStack {
            
            HStack(spacing: 0) {
                
                VStack(spacing: 22) {
                    
                    HStack {
                        
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 45, height: 45)
                        
                        Text("Pinterest")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        
                        Spacer(minLength: 0)
                    }
                    .padding(.top, 25)
                    .padding(.leading, 10)
                    
                    
                    TabButton(image: "house.fill", title: "Home", selected: $selected, animation: animation)
                    
                    TabButton(image: "clock.fill", title: "Recents", selected: $selected, animation: animation)
                    
                    TabButton(image: "person.2.fill", title: "Following", selected: $selected, animation: animation)
                    
                    Spacer(minLength: 0)
                    
                }
                
                Divider()
                    .offset(x: -2)
                
            } //: SIDE BAR
            .frame(width: 220)
            
            Spacer()
            
        }
        .frame(width: window!.width / 1.6, height: window!.height - 40)
        .background(Color.white.opacity(0.6))
        .background(BlurWindow())
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
