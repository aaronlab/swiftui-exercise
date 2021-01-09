//
//  SecondView.swift
//  Custom-NavigationBar
//
//  Created by Aaron Lee on 2020-10-29.
//

import SwiftUI

struct SecondView: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @State var navBarColor: UIColor = .red

    var body: some View {
        GeometryReader { geometry in

            VStack(spacing: 30) {

                Button(action: {
                    self.navBarColor = .black
                }, label: {
                        Text("Change to Black")
                    })

                Button(action: {
                    self.navBarColor = .red
                }, label: {
                        Text("Back to Red")
                    })

            }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)


        }
            .navigationBarTitle("Second View")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                            Image(systemName: "chevron.left")
                        })
            )
            .navigationBarColor(navBarColor)
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
