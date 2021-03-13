//
//  ContentView.swift
//  ChoosableSheet
//
//  Created by Aaron Lee on 2021/03/13.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isFullScreen = false
    @State private var showSheet = false
    
    var body: some View {
        VStack(spacing: 30) {
            
            Button(action: {
                isFullScreen = false
                showSheet.toggle()
            }, label: {
                Text("Open Modal")
            })
            
            Button(action: {
                isFullScreen = true
                showSheet.toggle()
            }, label: {
                Text("Open Full Screen Sheet")
            })
            
        }
        .modifier(
            ChooseableSheet(
                isFullScreen: $isFullScreen,
                isPresented: $showSheet,
                fullScreenContent: {
                    Button(action: {
                        showSheet.toggle()
                    }, label: {
                        Text("Full Screen")
                    })
                },
                modalContent: {
                    Button(action: {
                        showSheet.toggle()
                    }, label: {
                        Text("Modal")
                    })
                }
            )
        )
        .preferredColorScheme(.light)
    }
}

struct ChooseableSheet<Destination>: ViewModifier where Destination: View {
    
    @Binding var isFullScreen: Bool
    @Binding var isPresented: Bool
    private let fullScreenContent: () -> Destination?
    private let modalContent: () -> Destination?
    
    init(
        isFullScreen: Binding<Bool>,
        isPresented: Binding<Bool>,
        @ViewBuilder fullScreenContent: @escaping () -> Destination? = { nil },
        @ViewBuilder modalContent: @escaping () -> Destination? = { nil }
    ) {
        self._isFullScreen = isFullScreen
        self._isPresented = isPresented
        self.fullScreenContent = fullScreenContent
        self.modalContent = modalContent
    }
    
    func body(content: Content) -> some View {
        if isFullScreen {
            return AnyView(
                content
                    .fullScreenCover(isPresented: $isPresented) {
                        fullScreenContent()
                    }
                    .preferredColorScheme(.light)
            )
        } else {
            return AnyView(
                content
                    .sheet(isPresented: $isPresented) {
                        modalContent()
                    }
                    .preferredColorScheme(.light)
            )
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
