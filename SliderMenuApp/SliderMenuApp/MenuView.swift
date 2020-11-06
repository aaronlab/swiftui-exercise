//
//  MenuView.swift
//  SliderMenuApp
//
//  Created by Aaron Lee on 2020-11-06.
//

import SwiftUI

struct MenuView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            // PROFILE
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                
                Text("Profile")
                    .foregroundColor(.gray)
                    .font(.headline)
            } //: HSTACK
            .padding(.top, 100)
            
            // MESSAGE
            HStack {
                Image(systemName: "envelope")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Messages")
                    .foregroundColor(.gray)
                    .font(.headline)
            } //: HSTACK
            .padding(.top, 30)
            
            // SETTINGS
            HStack {
                Image(systemName: "gear")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Settings")
                    .foregroundColor(.gray)
                    .font(.headline)
            } //: HSTACK
            .padding(.top, 30)
            
            Spacer(minLength: 0)
            
        } //: VSTACK
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 32/255, green: 23/255, blue: 23/255))
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
