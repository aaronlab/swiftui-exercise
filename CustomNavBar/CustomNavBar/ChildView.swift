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
    
    var infiniteAnimation: Animation {
        Animation.linear(duration: 2.0)
            .repeatForever()
    }
    
    // MARK: - BODY
    
    var body: some View {
        
        VStack(spacing: 16) {
            Spacer()
            
            Text("Child View")
            
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
        .onAppear {
            withAnimation(infiniteAnimation) {
                self.navBarColor = .orange
                self.navBarColor = .black
                self.navBarColor = .red
                self.navBarColor = .green
                self.navBarColor = .blue
            }
        }
        
    }
}

struct ChildView_Previews: PreviewProvider {
    static var previews: some View {
        ChildView()
    }
}
