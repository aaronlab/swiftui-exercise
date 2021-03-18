//
//  ContentView.swift
//  TagsView
//
//  Created by Aaron Lee on 2021/03/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Home()
                .navigationTitle("Chips")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    
    @State private var text = ""
    
    @State private var chips: [[ChipData]] = []
    
    var body: some View {
        VStack(spacing: 35) {
            
            ScrollView {
                
                // Chips
                
                LazyVStack(spacing: 10) {
                    
                    ForEach(chips.indices, id: \.self) { index in
                        
                        HStack {
                            
                            ForEach(chips[index].indices, id: \.self) { chipIndex in
                                
                                Text(chips[index][chipIndex].chipText)
                                    .fontWeight(.semibold)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal)
                                    .background(
                                        Capsule()
                                            .stroke(Color.black, lineWidth: 1)
                                    )
                                    .lineLimit(1)
                                    .overlay(
                                        
                                        GeometryReader { geo -> Color in
                                            
                                            let maxX = geo.frame(in: .global).maxX
                                            
                                            if maxX > UIScreen.main.bounds.width - 70 && !chips[index][chipIndex].isExceeded {
                                                
                                                print(chipIndex)
                                                DispatchQueue.main.async {
                                                    
                                                    chips[index][chipIndex].isExceeded = true
                                                    let lastItem = chips[index][chipIndex]
                                                    chips.append([lastItem])
                                                    chips[index].remove(at: chipIndex)
                                                    
                                                }
                                                
                                            }
                                            
                                            return Color.clear
                                            
                                        },
                                        
                                        alignment: .trailing
                                        
                                    )
                                    .clipShape(Capsule())
                                
                            }
                            
                        }
                        
                    }
                    
                } //: V
                .padding()
                
            } //: S
            .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height / 3)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.gray.opacity(0.4), lineWidth: 1.5)
            )
            
            // Text Editor
            
            TextEditor(text: $text)
                .padding()
                .frame(height: 150)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.gray.opacity(0.4), lineWidth: 1.5)
                )
            
            // Add Button
            
            Button(action: {
                if chips.isEmpty {
                    chips.append([])
                }
                withAnimation(.default) {
                    chips[chips.count - 1].append(ChipData(chipText: text))
                    text = ""
                }
            }, label: {
                Text("Add Tag")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(Color.purple)
            })
            .disabled(text == "")
            .opacity(text == "" ? 0.45 : 1.0)
            
        } //: V
        .padding()
    }
    
}

struct ChipData: Identifiable, Hashable {
    var id = UUID().uuidString
    var chipText: String
    var isExceeded = false
}
