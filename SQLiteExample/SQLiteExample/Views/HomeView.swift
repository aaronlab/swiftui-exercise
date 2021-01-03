//
//  HomeView.swift
//  SQLiteExample
//
//  Created by Aaron Lee on 2021-01-03.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            
            VStack(alignment: .leading, spacing: 0) {
                
                HStack {
                    Spacer(minLength: 0)
                    
                    NavigationLink("Add", destination: AddView())
                        .padding()
                } //: H
                
                List {
                    
                    self.makeRow(name: "Aaron", email: "aaronlab.net@gmail.com", mobileNo: "123456")
                } //: L
                .listStyle(PlainListStyle())
            } //: V
            .navigationBarTitle("Home View", displayMode: .inline)
        } //: N
    }
    
    private func makeRow(name: String?, email: String?, mobileNo: String?) -> some View {
        return HStack {
            
            Text(name ?? "N/A")
                .lineLimit(1)
            Spacer(minLength: 0)
            Text(email ?? "N/A")
                .lineLimit(1)
            Spacer(minLength: 0)
            Text(mobileNo ?? "N/A")
                .lineLimit(1)
        } //: H
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
