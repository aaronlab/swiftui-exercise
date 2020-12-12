//
//  Detail.swift
//  SwipeFullScreenModal
//
//  Created by Aaron Lee on 2020-12-12.
//

import SwiftUI

struct Detail: View {
    
    @ObservedObject var detail: DetailViewModel
    
    var animation: Namespace.ID
    
    @State var scale: CGFloat = 1
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                    
                    Image(detail.selectedItem.contentImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .matchedGeometryEffect(id: detail.selectedItem.contentImage, in: animation)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.5)
                    
                    HStack {
                        
                        Text(detail.selectedItem.overlay)
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                        
                        Spacer(minLength: 0)
                        
                        Button(action: {
                            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.8)) {
                                detail.show.toggle()
                            }
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(Color.black.opacity(0.7))
                                .padding()
                                .background(Color.white.opacity(0.8))
                                .clipShape(Circle())
                        })
                    } //: H
                    .padding(.horizontal)
                    .padding(.top, UIApplication.shared.windows.first!.safeAreaInsets.top + 10)
                } //: Z
                .gesture(DragGesture(minimumDistance: 0).onChanged(onChanged(value:)).onEnded(onEnded(value:)))
                
                HStack {
                    
                    Image(detail.selectedItem.logo)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 65, height: 65)
                        .cornerRadius(15)
                    
                    VStack(alignment: .leading, spacing: 6) {
                        
                        Text(detail.selectedItem.title)
                            .fontWeight(.bold)
                        
                        Text(detail.selectedItem.category)
                            .font(.caption)
                            .foregroundColor(.gray)
                    } //: V
                    
                    Spacer(minLength: 0)
                    
                    VStack {
                        
                        Button(action: {}, label: {
                            
                            Text("GET")
                                .fontWeight(.bold)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 25)
                                .background(Color.primary.opacity(0.1))
                                .clipShape(Capsule())
                        }) //: B
                        
                        Text("In App Purchase")
                            .font(.caption)
                            .foregroundColor(.gray)
                    } //: V
                } //: H
                .matchedGeometryEffect(id: detail.selectedItem.id, in: animation)
                .padding()
                
                Text("Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah")
                    .padding()
                
                Button(action: {}) {
                    
                    Label(title: {
                        Text("Share")
                            .foregroundColor(.primary)
                    }) {
                        Image(systemName: "square.and.arrow.up.fill")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 25)
                    .background(Color.primary.opacity(0.1))
                    .cornerRadius(20)
                }
                .padding()
            } //: V
        } //: S
        .scaleEffect(scale)
        .ignoresSafeArea(.all, edges: .top)
    }
    
    func onChanged(value: DragGesture.Value) {
        let scale = value.translation.height / UIScreen.main.bounds.height
        if 1 - scale > 0.7 {
            self.scale = 1 - scale
        }
    }
    
    func onEnded(value: DragGesture.Value) {
        withAnimation(.spring()) {
            if scale < 0.9 {
                detail.show.toggle()
            }
            self.scale = 1
        }
    }
}
