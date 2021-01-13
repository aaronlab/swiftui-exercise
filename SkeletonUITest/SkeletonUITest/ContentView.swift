//
//  ContentView.swift
//  SkeletonUITest
//
//  Created by Aaron Lee on 2021/01/13.
//

import SwiftUI
import SkeletonUI

struct User: Identifiable {
    let id = UUID()
    let name: String
}

struct ContentView: View {
    
    @State private var users = [String]()
    @State private var users2 = [User]()
    
    var body: some View {
        VStack {
            
            SkeletonList(with: users2, quantity: 100) { (loading, user) in
                
                Text(user?.name)
                    .skeleton(with: loading)
                    .shape(type: .rectangle)
                    .appearance(type: .solid(color: .red, background: .blue))
                    .multiline(lines: 3, scales: [1: 0.5])
                    .animation(type: .pulse())
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    self.users2 = [User(name: "John Doe"),
                                  User(name: "Jane Doe"),
                                  User(name: "James Doe"),
                                  User(name: "Judy Doe")]
                }
            }
            
//            Text("Finished \(self.users.count)")
//                .skeleton(with: users.isEmpty)
//                .onAppear {
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//                        self.users = ["John Doe", "Jane Doe", "James Doe", "Judy Doe"]
//                    }
//                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
