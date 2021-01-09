//
//  ContentView.swift
//  MapViewExample
//
//  Created by Aaron Lee on 2021/01/09.
//

import SwiftUI
import MapKit
import RespondableTextField

struct ContentView: View {
    
    @Environment(\.colorScheme) private var colorScheme
    @State private var isMapView = false
    
    var body: some View {
        ZStack {
            
            VStack {
                
                Text(isMapView ? "Map" : "Diary")
                
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width)
            .background(isMapView ? Color.orange.ignoresSafeArea() : Color.green.ignoresSafeArea())
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Button {
                        withAnimation(.linear(duration: 0.3)) {
                            self.isMapView.toggle()
                        }
                    } label: {
                        ZStack {
                            
                            Circle()
                                .foregroundColor(.white)
                                .shadow(color: Color.black.opacity(0.16), radius: 3, x: 5, y: 5)
                            
                            if self.isMapView {
                                Image(systemName: "note.text")
                            } else {
                                Image(systemName: "map.fill")
                            }
                        }
                    }
                    .frame(width: 50, height: 50)
                    .accentColor(Constants.Colors.mainColor)

                }
                .padding()
                
                Spacer()
            }
            
        }
    }
}

struct Constants {
    struct Colors {
        static let mainColor = Color("Main")
    }
}

// MARK: - MAKE VIEWS

extension ContentView {
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
