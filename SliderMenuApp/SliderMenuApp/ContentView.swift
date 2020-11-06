//
//  ContentView.swift
//  SliderMenuApp
//
//  Created by Aaron Lee on 2020-11-06.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    @State var showMenu = false
    
    // MARK: - BODY
    
    var body: some View {
        
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -10 {
                    withAnimation(.easeInOut) {
                        showMenu = false
                    }
                }
            }
        
        return
            NavigationView {
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        MainView(showMenu: $showMenu)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .offset(x: showMenu ? geometry.size.width / 1.5 : 0)
                            .disabled(showMenu)
                        
                        if showMenu {
                            Color.black.opacity(0.4).edgesIgnoringSafeArea(.all)
                            
                            MenuView()
                                .frame(width: geometry.size.width / 1.5)
                                .transition(.move(edge: .leading))
                        } //: MENU VIEW
                    } //: ZSTACK
                    .gesture(drag)
                    
                } //: GEOMETRY
                .navigationBarTitle("Slider Menu", displayMode: .inline)
                .navigationBarItems(leading: (
                    Button(action: {
                        withAnimation(.easeInOut) {
                            self.showMenu.toggle()
                        }
                    }, label: {
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                            .foregroundColor(showMenu ? .white : .black)
                    })
                ))
                
            } //: NAVIGATION
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
