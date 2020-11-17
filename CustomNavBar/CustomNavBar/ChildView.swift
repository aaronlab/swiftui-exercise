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
    
    // MARK: - BODY
    
    var body: some View {
        
        VStack {
            Spacer()
            
            Text("Child View")
            
            Spacer()
        } //: VSTACK
        
        // FRAME SETUP
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .edgesIgnoringSafeArea(.bottom)
        
        // NAVIGATION BAR SETUP
        .navBarColor(.orange)
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
