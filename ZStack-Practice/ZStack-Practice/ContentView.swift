//
//  ContentView.swift
//  ZStack-Practice
//
//  Created by Aaron Lee on 2020-10-31.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsShowing: Bool = false
    
    var body: some View {


        GeometryReader { proxy in

            ZStack {

                VStack {

                    Button(action: {
                        self.alertIsShowing.toggle()
                    }, label: {
                        Text("Test Alert")
                    })

                }

                AlertView(isShowing: $alertIsShowing, geoProxy: proxy)

            }

        }


    }
}

struct AlertView: View {
    
    @Binding var isShowing: Bool
    
    let geoProxy: GeometryProxy
    
    var body: some View {
        
        GeometryReader { proxy in

            ZStack {
                
                if isShowing {
                    VStack {

                        VStack {

                            HStack {
                                Text("Title or Alert")
                                    .font(.system(size: 18, weight: .bold, design: .default))
                                    .foregroundColor(.red)
                                Spacer()
                            }
                            
                            Spacer()
                            
                            HStack {
                                
                                Text("Description of Alert")
                                    .font(.system(size: 18, weight: .regular, design: .default))
                                
                            }
                            
                            Spacer()
                            
                            Divider()
                            
                            HStack {
                                
                                Button(action: {
                                    isShowing.toggle()
                                }, label: {
                                    Text("Cancel")
                                        .foregroundColor(.red)
                                })
                                
                                Spacer()
                                
                                Button(action: {
                                    isShowing.toggle()
                                }, label: {
                                    Text("Confirm")
                                })
                                
                            }.padding(.leading, 16)
                            .padding(.trailing, 16)

                        }.padding(16)

                    }
                    .frame(width: proxy.size.width - 32, height: 200, alignment: .center)
                    .background(Color.white)
                }

            }
            .frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)

        }.frame(width: geoProxy.size.width, height: geoProxy.size.height, alignment: .center)
        .background(isShowing ? Color.black.opacity(0.6) : .clear)
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
