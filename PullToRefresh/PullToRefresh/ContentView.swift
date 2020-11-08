//
//  ContentView.swift
//  PullToRefresh
//
//  Created by Aaron Lee on 2020-11-08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct Home: View {
    
    @State var data = ["Data 1", "Data 2", "Data 3"]
    @State var refresh = Refresh(started: false, released: false)
    @State var newDataNum: Int = 1
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            HStack {
                
                Text("Pull to Refresh!")
                    .font(.system(size: 30, weight: .heavy, design: .monospaced))
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .padding(.vertical, 16)
                
                Spacer()
            } //: HSTACK
            .padding()
            .background(Color.white.ignoresSafeArea(.all, edges: .top))
            
            Divider()
            
            ScrollView(.vertical, showsIndicators: false) {
                
                GeometryReader { geometry -> AnyView in
                    
                    DispatchQueue.main.async {
                        if refresh.startOffset == 0 {
                            refresh.startOffset = geometry.frame(in: .global).minY
                        }
                        
                        refresh.offset = geometry.frame(in: .global).minY
                        
                        if refresh.offset - refresh.startOffset > 50 && !refresh.started {
                            refresh.started = true
                        }
                        
                        if refresh.startOffset == refresh.offset && refresh.started && !refresh.released {
                            withAnimation(.linear) {
                                refresh.released = true
                            }
                            updateData()
                        }
                    }
                    
                    return AnyView(Color.black.frame(width: 0, height: 0))
                } //: GEOMETRY
                .frame(width: 0, height: 0)
                
                ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                    
                    if refresh.started && refresh.released {
                        ProgressView()
                            .offset(y: -35)
                    } else {
                        Image(systemName: "arrow.down")
                            .font(.system(size: 16, weight: .heavy))
                            .foregroundColor(.gray)
                            .rotationEffect(.init(degrees: refresh.started ? 180 : 0))
                            .offset(y: -25)
                            .animation(.easeInOut)
                    }
                    
                    VStack {
                        
                        ForEach(data, id: \.self) { data in
                            VStack(spacing: 0) {
                                
                                HStack {
                                    
                                    Text(data)
                                        .font(.system(size: 16, design: .monospaced))
                                    
                                    Spacer()
                                } //: HSTACK
                                .padding()
                                
                                Rectangle().frame(height: 1)
                                    .foregroundColor(Color.gray.opacity(0.3))
                            } //: VSTACK
                        }
                    } //: VSTACK
                    .background(Color.white)
                } //: ZSTACK
                .offset(y: refresh.released ? 40 : -10)
            } //: SCROLL
        } //: VSTACK
        .background(Color.black.opacity(0.06).ignoresSafeArea())
    }
    
    func updateData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(.linear) {
                data.append("New Data \(newDataNum)")
                refresh.started = false
                refresh.released = false
            }
            self.newDataNum += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Refresh {
    var startOffset: CGFloat = 0
    var offset: CGFloat = 0
    var started: Bool
    var released: Bool
}
