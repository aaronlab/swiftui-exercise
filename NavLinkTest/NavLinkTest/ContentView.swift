//
//  ContentView.swift
//  NavLinkTest
//
//  Created by Aaron Lee on 2021/02/04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            VStack {
                NavigationLink("Detail", destination: DetailView())
                    .isDetailLink(false)
                
                Text("Home")
            }
            .navigationBarTitle("Home", displayMode: .inline)
        }
    }
}

struct DetailView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        
        Text("Detail")
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("Detail", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Back")
            }))
        
    }
    
}

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
