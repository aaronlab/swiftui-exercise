//
//  HomeView.swift
//  Calculator
//
//  Created by Aaron Lee on 2020-11-10.
//

import SwiftUI

struct HomeView: View {
    
    @State var numbers: [String] = ["0"]
    @State var beforeNum: Double = 0
    @State var sign: Sign = .none
    @State var removedFlag: Bool = false
    
    var body: some View {
        var convertedNumbers: String {
            return self.numbers.reduce("") { $0 + $1 }
        }
        
        return GeometryReader { geometry in
            ZStack {
                
                K.Colors.darkGray
                    .ignoresSafeArea()
                
                VStack(spacing: 1) {
                    Text(convertedNumbers)
                        .font(.largeTitle)
                        .padding()
                        .frame(width: geometry.size.width, height: geometry.size.height / 6, alignment: .trailing)
                    
                    // 1ST ROW
                    HStack(spacing: 1) {
                        Button(action: {
                            self.numbers.removeAll()
                            self.numbers.append("0")
                        }, label: {
                            Text("AC")
                                .font(.title)
                                .frame(width: (geometry.size.width / 4) - 1, height: geometry.size.height / 6)
                                .background(K.Colors.mediumGray)
                        })
                        
                        Button(action: {
                            self.processSign(sign: .converse)
                        }, label: {
                            Image(systemName: "plus.slash.minus")
                                .font(.title)
                                .frame(width: (geometry.size.width / 4) - 1, height: geometry.size.height / 6)
                                .background(K.Colors.mediumGray)
                        })
                        
                        Button(action: {
                            self.processSign(sign: .percent)
                        }, label: {
                            Text("%")
                                .font(.title)
                                .frame(width: (geometry.size.width / 4) - 1, height: geometry.size.height / 6)
                                .background(K.Colors.mediumGray)
                        })
                        
                        Button(action: {
                            self.processSign(sign: .divide)
                        }, label: {
                            Image(systemName: "divide")
                                .font(.title)
                                .frame(width: geometry.size.width / 4, height: geometry.size.height / 6)
                                .background(K.Colors.orange)
                        })
                        
                    } //: 1ST ROW
                    
                    // 2ND ROW
                    HStack(spacing: 1) {
                        Button(action: {
                            self.appendNum(number: "7")
                        }, label: {
                            Text("7")
                                .font(.title)
                                .frame(width: (geometry.size.width / 4) - 1, height: geometry.size.height / 6)
                                .background(K.Colors.mediumGray)
                        })
                        
                        Button(action: {
                            self.appendNum(number: "8")
                        }, label: {
                            Text("8")
                                .font(.title)
                                .frame(width: (geometry.size.width / 4) - 1, height: geometry.size.height / 6)
                                .background(K.Colors.mediumGray)
                        })
                        
                        Button(action: {
                            self.appendNum(number: "9")
                        }, label: {
                            Text("9")
                                .font(.title)
                                .frame(width: (geometry.size.width / 4) - 1, height: geometry.size.height / 6)
                                .background(K.Colors.mediumGray)
                        })
                        
                        Button(action: {
                            self.processSign(sign: .multiply)
                        }, label: {
                            Image(systemName: "multiply")
                                .font(.title)
                                .frame(width: geometry.size.width / 4, height: geometry.size.height / 6)
                                .background(K.Colors.orange)
                        })
                        
                    } //: 2ND ROW
                    
                    // 3RD ROW
                    HStack(spacing: 1) {
                        Button(action: {
                            self.appendNum(number: "4")
                        }, label: {
                            Text("4")
                                .font(.title)
                                .frame(width: (geometry.size.width / 4) - 1, height: geometry.size.height / 6)
                                .background(K.Colors.mediumGray)
                        })
                        
                        Button(action: {
                            self.appendNum(number: "5")
                        }, label: {
                            Text("5")
                                .font(.title)
                                .frame(width: (geometry.size.width / 4) - 1, height: geometry.size.height / 6)
                                .background(K.Colors.mediumGray)
                        })
                        
                        Button(action: {
                            self.appendNum(number: "6")
                        }, label: {
                            Text("6")
                                .font(.title)
                                .frame(width: (geometry.size.width / 4) - 1, height: geometry.size.height / 6)
                                .background(K.Colors.mediumGray)
                        })
                        
                        Button(action: {
                            self.processSign(sign: .minus)
                        }, label: {
                            Image(systemName: "minus")
                                .font(.title)
                                .frame(width: geometry.size.width / 4, height: geometry.size.height / 6)
                                .background(K.Colors.orange)
                        })
                        
                    } //: 3RD ROW
                    
                    // 4TH ROW
                    HStack(spacing: 1) {
                        Button(action: {
                            self.appendNum(number: "1")
                        }, label: {
                            Text("1")
                                .font(.title)
                                .frame(width: (geometry.size.width / 4) - 1, height: geometry.size.height / 6)
                                .background(K.Colors.mediumGray)
                        })
                        
                        Button(action: {
                            self.appendNum(number: "2")
                        }, label: {
                            Text("2")
                                .font(.title)
                                .frame(width: (geometry.size.width / 4) - 1, height: geometry.size.height / 6)
                                .background(K.Colors.mediumGray)
                        })
                        
                        Button(action: {
                            self.appendNum(number: "3")
                        }, label: {
                            Text("3")
                                .font(.title)
                                .frame(width: (geometry.size.width / 4) - 1, height: geometry.size.height / 6)
                                .background(K.Colors.mediumGray)
                        })
                        
                        Button(action: {
                            self.processSign(sign: .plus)
                        }, label: {
                            Image(systemName: "plus")
                                .font(.title)
                                .frame(width: geometry.size.width / 4, height: geometry.size.height / 6)
                                .background(K.Colors.orange)
                        })
                        
                    } //: 4TH ROW
                    
                    // 5TH ROW
                    HStack(spacing: 1) {
                        Button(action: {
                            self.appendNum(number: "0")
                        }, label: {
                            Text("0")
                                .font(.title)
                                .frame(width: (geometry.size.width / 2) - 1, height: geometry.size.height / 6)
                                .background(K.Colors.mediumGray)
                        })
                        
                        Button(action: {
                            self.processSign(sign: .point)
                        }, label: {
                            Text(".")
                                .font(.title)
                                .frame(width: (geometry.size.width / 4) - 1, height: geometry.size.height / 6)
                                .background(K.Colors.mediumGray)
                        })
                        
                        Button(action: {
                            self.processSign(sign: .equals)
                        }, label: {
                            Text("=")
                                .font(.title)
                                .frame(width: geometry.size.width / 4, height: geometry.size.height / 6)
                                .background(K.Colors.orange)
                        })
                        
                    } //: 5TH ROW
                    
                } //: VSTACK
                .foregroundColor(.white)
        
                
            } //: ZSTACK
            
        } //: GEOMETRY
    }
    
    func appendNum(number: String) {
        if sign == .none {
            if numbers.count == 1 && numbers[0] == "0" {
                self.numbers.removeAll()
            }
            self.numbers.append(number)
        } else {
            if !removedFlag {
                self.numbers.removeAll()
                removedFlag.toggle()
            }
            self.numbers.append(number)
        }
    }
    
    func processSign(sign: Sign) {
        if sign != .equals {
            self.removedFlag = false
            self.beforeNum = Double(numbers.reduce("") { $0 + $1 })!
            self.sign = sign
            
            self.calculate()
        } else {
            // TODO: SUM
        }
    }
    
    func calculate() {
        let newValue = Double(self.numbers.reduce("") { $0 + $1 })!
        
        if beforeNum != 0 {
            if self.sign != .none {
                switch sign {
                case .converse:
                    self.numbers.removeAll()
                    self.numbers.append("\(-newValue)")
                case .percent:
                    self.numbers.removeAll()
                    self.numbers.append("\(newValue / 100)")
                case .divide:
                    self.numbers.append("\(self.beforeNum / newValue)")
                case .multiply:
                    print("")
                case .minus:
                    print("")
                case .plus:
                    print("")
                case .point:
                    print("")
                default:
                    break
                }
            }
        } else {
            
            
        }
        
    }
    
}

enum Sign {
    case converse, percent, divide, multiply, minus, plus, equals, point, none
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
