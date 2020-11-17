//
//  ChildView.swift
//  CustomNavBar
//
//  Created by Aaron Lee on 2020-11-17.
//

import SwiftUI

struct ChildView: View {
    // MARK: - PROPERTIES
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @GestureState private var dragOffset = CGSize.zero
    
    @State var navBarColor: UIColor = .orange
    
    // MARK: - BODY
    
    var body: some View {
        
        VStack(spacing: 16) {
            Spacer()
            
            Text("Child View")
            
            Button(action: {
                navBarColor = .orange
            }, label: {
                Text("Orange")
            })
            
            Button(action: {
                navBarColor = .black
            }, label: {
                Text("Black")
            })
            
            Button(action: {
                navBarColor = .red
            }, label: {
                Text("Red")
            })
            
            Button(action: {
                navBarColor = .green
            }, label: {
                Text("Green")
            })
            
            Button(action: {
                navBarColor = .blue
            }, label: {
                Text("Blue")
            })
            
            Spacer()
        } //: VSTACK
        
        // FRAME SETUP
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .edgesIgnoringSafeArea(.bottom)
        
        // NAVIGATION BAR SETUP
        .navBarColor(navBarColor)
        .navigationBarTitle("Child View", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "chevron.backward")
                    .foregroundColor(.white)
            })
        )
        
        // DISMISS GESTURE
        .gesture(DragGesture()
                    .updating(
                        $dragOffset,
                        body: { value, state, transaction in
                            
                            if value.startLocation.x < 20 && value.translation.width > 100 {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        }
                    )
        ) //: DISMISS GESTURE
        
    }
}

struct ChildView_Previews: PreviewProvider {
    static var previews: some View {
        ChildView()
    }
}
