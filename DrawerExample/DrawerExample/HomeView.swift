//
//  ContentView.swift
//  DrawerExample
//
//  Created by Aaron Lee on 2020-12-15.
//

import SwiftUI
import Drawer

struct HomeView: View {
    
    @ObservedObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ZStack {
                    
                    NavigationLink(
                        destination: viewModel.destination,
                        tag: NavigationStatus.pop,
                        selection: $viewModel.navigationStatus,
                        label: { EmptyView() })
                    
                    VStack(alignment: .center, spacing: 20) {
                        Text("Home View")
                        
                        Button(action: {
                            self.viewModel.navigationStatus = .pop
                        }, label: {
                            Text("Go to the Second View")
                        })
                        
                        Button(action: {
                            self.viewModel.showDrawer.toggle()
                        }, label: {
                            Text("Show Drawer")
                        })
                    } //: V
                    .frame(width: geo.size.width, height: geo.size.height)
                    
                    if viewModel.showDrawer {
                        
                        Drawer {
                            
                            ZStack {
                                
                                RoundedRectangle(cornerRadius: 12)
                                    .foregroundColor(.white)
                                    .shadow(radius: 100)
                                
                                VStack(alignment: .center) {
                                    Spacer().frame(height: 4.0)
                                    RoundedRectangle(cornerRadius: 3.0)
                                        .foregroundColor(.gray)
                                        .frame(width: 30.0, height: 6.0)
                                    Spacer()
                                } //: V
                            } //: Z
                        } //: D
                        .rest(at: .constant([100, 340, UIScreen.main.bounds.height - 40]))
                        .impact(.light)
                        .edgesIgnoringSafeArea(.all)
                    } //: IF
                } //: Z
            } //: G
            .navigationBarTitle("Home View")
        }  //: N
        .preferredColorScheme(.light)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
