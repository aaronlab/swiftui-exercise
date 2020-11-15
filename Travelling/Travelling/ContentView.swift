//
//  ContentView.swift
//  Travelling
//
//  Created by Aaron Lee on 2020-11-15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            Home().tabItem {
                Image("home").font(.title)
            }
            
            Text("activity").tabItem {
                Image("activity").font(.title)
            }
            
            Text("search").tabItem {
                Image("search").font(.title)
            }
            
            Text("person").tabItem {
                Image("Setting").font(.title)
            }
        }
    }
}

struct Home: View {
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                
                HStack {
                    
                    Button {
                        
                    } label: {
                        
                        Image("menu").renderingMode(.original)
                        
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        
                        Image("Profile").renderingMode(.original)
                        
                    }
                    
                    
                }
                
                Text("Find More").fontWeight(.heavy).font(.largeTitle).padding(.top, 16)
                
                HStack {
                    
                    Button {
                        
                    } label: {
                        
                        Text("Experiences").fontWeight(.heavy).foregroundColor(.black)
                        
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        
                        Text("Adventures").foregroundColor(.gray)
                        
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        
                        Text("Activities").foregroundColor(.gray)
                        
                    }
                    
                }.padding([.top,], 30)
                .padding(.bottom, 15)
                
                MiddleView()
                BottomView().padding(.top, 10)
                
            }.padding()
        }
        
    }
}

struct BottomView: View {
    var body: some View {
        
        VStack {
            
            HStack {
                
                Text("What you want?").fontWeight(.heavy)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("View all").foregroundColor(.gray)
                }
            }.padding([.top], 16)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 35) {
                    
                    Button {
                        
                    } label: {
                        VStack(spacing: 8) {
                            
                            Image("mcard1").renderingMode(.original)
                            Text("Hiking").foregroundColor(.gray)
                        }
                    }

                    
                    Button {
                        
                    } label: {
                        VStack(spacing: 8) {
                            
                            Image("mcard2").renderingMode(.original)
                            Text("Ski").foregroundColor(.gray)
                        }
                    }
                    
                    
                    Button {
                        
                    } label: {
                        VStack(spacing: 8) {
                            Image("mcard3").renderingMode(.original)
                            Text("Sky Diving").foregroundColor(.gray)
                        }
                    }
                    
                    Button {
                        
                    } label: {
                        VStack(spacing: 8) {
                            
                            Image("mcard4").renderingMode(.original)
                            Text("Skate Board").foregroundColor(.gray)
                        }
                    }

                }
            }.padding(.leading, 20)
            .padding(.vertical, 15)
        }
    }
}

struct MiddleView: View {
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack(spacing: 20) {
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    Button {
                        
                    } label: {
                        
                        Image("Card1").renderingMode(.original)
                        
                    }
                    
                    Text("Fising Time").fontWeight(.heavy)
                    
                    HStack(spacing: 5) {
                        
                        Image("map").renderingMode(.original)
                        Text("Vancouver, CA").foregroundColor(.gray)
                    }
                    
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    Button {
                        
                    } label: {
                        
                        Image("Card2").renderingMode(.original)
                        
                    }
                    
                    Text("Forest Camping").fontWeight(.heavy)
                    
                    HStack(spacing: 5) {
                        
                        Image("map").renderingMode(.original)
                        Text("Kecamatan Klojen").foregroundColor(.gray)
                    }
                    
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
