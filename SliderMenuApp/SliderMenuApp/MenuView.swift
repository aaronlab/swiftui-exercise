//
//  MenuView.swift
//  SliderMenuApp
//
//  Created by Aaron Lee on 2020-11-06.
//

import SwiftUI

struct MenuView: View {
    // MARK: - PROPERTIES
    
    @State private var showAlert = false
    
    // MARK: - BODY
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            // OPPORTUNITIES
            HStack {
                Image(systemName: "globe")
                    .foregroundColor(.white)
                    .imageScale(.large)
                
                Text("OPPORTUNITIES")
                    .foregroundColor(.white)
                    .font(.headline)
            } //: HSTACK
            .padding(.top, 100)
            
            // PROFILE
            HStack {
                Image(systemName: "person.circle")
                    .foregroundColor(.white)
                    .imageScale(.large)
                Text("PROFILE")
                    .foregroundColor(.white)
                    .font(.headline)
            } //: HSTACK
            .padding(.top, 30)
            
            // SAVED
            HStack {
                Image(systemName: "bookmark")
                    .foregroundColor(.white)
                    .imageScale(.large)
                Text("SAVED")
                    .foregroundColor(.white)
                    .font(.headline)
            } //: HSTACK
            .padding(.top, 30)
            
            // SETTINGS
            HStack {
                Image(systemName: "gearshape")
                    .foregroundColor(.white)
                    .imageScale(.large)
                Text("SETTINGS")
                    .foregroundColor(.white)
                    .font(.headline)
            } //: HSTACK
            .padding(.top, 30)
            
            // ABOUT
            HStack {
                Image(systemName: "info.circle")
                    .foregroundColor(.white)
                    .imageScale(.large)
                Text("ABOUT")
                    .foregroundColor(.white)
                    .font(.headline)
            } //: HSTACK
            .padding(.top, 30)
            
            Spacer(minLength: 0)
            
        } //: VSTACK
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
