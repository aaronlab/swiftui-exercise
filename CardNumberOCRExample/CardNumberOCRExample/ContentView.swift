//
//  ContentView.swift
//  CardNumberOCRExample
//
//  Created by Aaron Lee on 2020-11-13.
//

import SwiftUI

struct ContentView: View {
    
    @State var navigationStatus: NavigationStatus? = NavigationStatus.ready
    @State var result: CreditCard?
    
    var body: some View {
        NavigationView {
            
            ZStack {
                
                NavigationLink(destination: ResultView(result: result), tag: NavigationStatus.pop, selection: $navigationStatus) {
                    EmptyView()
                }
                
                ScannerView(navigationStatus: $navigationStatus, result: $result)
            } //: ZSTACK
            .navigationBarHidden(true)
            
        } //: NAVIGATION
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
