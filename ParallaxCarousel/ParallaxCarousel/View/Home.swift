//
//  Home.swift
//  ParallaxCarousel
//
//  Created by Aaron Lee on 2020-12-05.
//

import SwiftUI

struct Home: View {
    
    @State var selected: Int = 0
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    var body: some View {
        
        TabView(selection: $selected) {
            
            // IMAGES
            ForEach(1...5, id: \.self) { index in
                
                // GEOMETRY
                
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
                    GeometryReader { reader in
                        
                        Image("p\(index)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .offset(x: -reader.frame(in: .global).minX)
                            .frame(width: width, height: height / 2)
                    }
                    .frame(height: height / 2)
                    .cornerRadius(15)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: -5, y: -5)
                    
                    Image("p\(index)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 55, height: 55)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                        .padding(5)
                        .background(Color.white)
                        .clipShape(Circle())
                        .offset(x: -15, y: 25)
                }
                .padding(.horizontal, 25)
                
                
            }
            
        }
        // PAGE TAB VIEW
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        
    }
}
