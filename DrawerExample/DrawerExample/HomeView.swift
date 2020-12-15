//
//  ContentView.swift
//  DrawerExample
//
//  Created by Aaron Lee on 2020-12-15.
//

import SwiftUI

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
                    } //: V
                    .frame(width: geo.size.width, height: geo.size.height)
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
