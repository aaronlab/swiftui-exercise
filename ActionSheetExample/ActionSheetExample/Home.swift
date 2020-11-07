//
//  Home.swift
//  ActionSheetExample
//
//  Created by Aaron Lee on 2020-11-07.
//

import SwiftUI
import MapKit

struct Home: View {
    
    @State var coordinate = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 38.897957, longitude: -77.036560), latitudinalMeters: 1000, longitudinalMeters: 1000)
    
    @State var filters = [
        FilterItem(title: "Most Relevant", checked: false),
        FilterItem(title: "Top Rated", checked: false),
        FilterItem(title: "Lowest Price", checked: false),
        FilterItem(title: "Highest Price", checked: false),
        FilterItem(title: "Most Favourite", checked: false),
        FilterItem(title: "Available Now", checked: false)
    ]
    
    @State var edges = UIApplication.shared.windows.first?.safeAreaInsets
    
    @State var showFilter = false
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            
            Map(coordinateRegion: $coordinate)
                .ignoresSafeArea()
            
            // FILTER BUTTON
            Button(action: {
                withAnimation {
                    self.showFilter.toggle()
                }
            }, label: {
                Image(systemName: "slider.vertical.3")
                    .font(.title2)
                    .foregroundColor(.black)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: -5, y: -5)
            }) //: FILTER BUTTON
            .padding(.trailing, 16)
            .padding(.top, 10)
            
            // FILTER OR RADIO BUTTON
            VStack {
                
                Spacer()
                
                VStack(spacing: 16) {
                    
                    HStack {
                        
                        Text("Search By")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Button(action: {
                            withAnimation {
                                self.showFilter.toggle()
                            }
                        }, label: {
                            Text("Done")
                                .fontWeight(.heavy)
                                .foregroundColor(Color.green)
                        }) //: BUTTON
                        
                    } //: HSTACK
                    .padding([.horizontal, .top], 16)
                    .padding(.bottom, 10)
                    
                    ForEach(filters) { filter in
                        
                        CardView(filter: filter)
                        
                    }
                    
                } //: VSTACK
                .padding(.bottom, 16)
                .padding(.bottom, edges?.bottom)
                .padding(.top, 10)
                .background(Color.white.clipShape(CustomCorner(corners: [.topLeft, .topRight])))
                .offset(y: showFilter ? 0 : UIScreen.main.bounds.height / 2)
                
            } //: VSTACK
            .ignoresSafeArea()
            .background(
                Color.black.opacity(0.3).ignoresSafeArea()
                    .opacity(showFilter ? 1 : 0)
                    .onTapGesture {
                        withAnimation {
                            showFilter.toggle()
                        }
                    }
            )
            
        } //: ZSTACK
        
    }
}
