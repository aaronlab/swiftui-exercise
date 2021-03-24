//
//  ContentView.swift
//  Coins
//
//  Created by Aaron Lee on 2021/03/24.
//

import SwiftUI
import RespondableTextField

struct ContentView: View {
    
    @State private var savedCoins = 0
    @State private var subtractCoins = ""
    @State private var addCoins = ""
    
    var body: some View {
        GeometryReader { geo in
            
            VStack(alignment: .leading, spacing: 32) {
                
                Spacer()
                
                Text("Saved Coins: \(savedCoins.withCommas())")
                
                HStack {
                    Image(systemName: "plus.square.fill")
                        .frame(height: 44)
                    RespondableTextField(text: $addCoins,
                                         tag: 0,
                                         placeholder: "Add")
                        .respondableKeyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(height: 44)
                } //: H
                
                HStack {
                    Image(systemName: "minus.square.fill")
                        .frame(height: 44)
                    RespondableTextField(text: $subtractCoins,
                                         tag: 1,
                                         placeholder: "Subtract")
                        .respondableKeyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(height: 44)
                }
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        setUserDefaults(with: 0)
                        savedCoins = 0
                    }) {
                        Text("Reset")
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        var newValue = savedCoins
                        
                        if let subtract = Int(subtractCoins) {
                            newValue -= subtract
                        }
                        
                        if let add = Int(addCoins) {
                            newValue += add
                        }
                        
                        setUserDefaults(with: newValue)
                        savedCoins = newValue
                        
                        subtractCoins = ""
                        addCoins = ""
                    }) {
                        Text("Save")
                    }
                    
                    Spacer()
                } //: H
                
                Spacer()
                
            } //: V
            .font(.title2)
            .padding()
            
        } //: G
        .background(
            Color.clear
                .contentShape(Rectangle())
                .onTapGesture {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
        )
        .onAppear {
            savedCoins = getUserDefaults()
        }
    }
}

fileprivate enum DataType: String {
    case savedCoins = "savedCoins"
}

fileprivate func setUserDefaults(for key: DataType = .savedCoins, with coins: Int) {
    UserDefaults.standard.setValue(coins, forKey: key.rawValue)
}

fileprivate func getUserDefaults(for key: DataType = .savedCoins) -> Int {
    return UserDefaults.standard.integer(forKey: key.rawValue)
}

extension Int {
    public func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value:self)) ?? "N/A"
    }
}
