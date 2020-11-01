//
//  ContentView.swift
//  Slide-Out-Menu
//
//  Created by Aaron Lee on 2020-11-01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            Color.white
            
            SlideMenu()
        }
        
    }
}

struct SlideMenu: View {
    
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    
    var body: some View {
        
        HStack(spacing: 0) {
            
            VStack(alignment: .leading) {
                
                Image("logo")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                
                HStack(alignment: .top, spacing: 12) {
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text("AaronLab")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                        
                        Text("@_AaronLab")
                            .foregroundColor(.gray)
                        
                        // Follow Counts
                        
                        HStack(spacing: 20) {
                            
                            FollowView(count: 10, title: "Following")
                                .onTapGesture {
                                    
                                }
                            
                            FollowView(count: 108, title: "Followers")
                                .onTapGesture {
                                    
                                }
                        }
                        .padding(.top, 10)
                        
                    }
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {}) {
                        Image(systemName: "chevron.down")
                            .foregroundColor(Color("twitter"))
                        
                    }
                    .padding(.top, 10)
                    
                }
                
                Divider()
                    .padding(.top)
                
                // Different View When up or down buttons pressed
                
                VStack(alignment: .leading) {
                    
                    // Menu Buttons
                    
                    ForEach(menuButtons, id: \.self) { menu in
                        Button(action: {
                            // Switch Action
                        }) {
                            MenuButton(title: menu)
                        }
                    }
                    
                    Divider()
                        .padding(.top, 10)
                    
                }
                
                Spacer(minLength: 0)
            }
            .padding(.horizontal, 20)
            // Vertical Edges are ignored
            .padding(.top, edges!.top == 0 ? 15 : edges?.top)
            .padding(.bottom, edges!.bottom == 0 ? 15 : edges?.bottom)
            // Default Width
            .frame(width: UIScreen.main.bounds.width - 50)
            .background(Color.white)
            .ignoresSafeArea(.all, edges: .vertical )
            
            Spacer(minLength: 0)
        }
        .background(Color.black.opacity(0.5).ignoresSafeArea(.all, edges: .vertical))
    }
    
}

struct FollowView: View {
    
    var count: Int
    var title: String
    
    var body: some View {
        
        HStack {
            
            Text("\(count)")
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Text(title)
                .foregroundColor(.gray)
            
        }
        
    }
}

var menuButtons = ["Profile", "Lists", "Topics", "Bookmarks", "Moments"]

struct MenuButton: View {
    var title: String
    var body: some View {
        
        HStack(spacing: 15) {
            
            Image(title)
                .resizable()
                .renderingMode(.template)
                .frame(width: 24, height: 24)
                .foregroundColor(.gray)
            
            Text(title)
                .foregroundColor(.black)
            
            Spacer(minLength: 0)
            
        }
        .padding(.vertical, 12)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
