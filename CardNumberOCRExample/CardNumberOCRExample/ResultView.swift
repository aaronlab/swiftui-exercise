//
//  ResultView.swift
//  CardNumberOCRExample
//
//  Created by Aaron Lee on 2020-11-13.
//

import SwiftUI

struct ResultView: View {
    
    let result: CreditCard?
    
    var body: some View {
        
        VStack {
            Text("Name: \(result?.name ?? "N/A")")
            Text("Number: \(result?.number ?? "N/A")")
            Text("Expire Year: \(String(result?.expireDate?.year ?? 00))")
            Text("Expire Month: \(String(result?.expireDate?.month ?? 00))")
        } //: VSTACK
        
    }
    
}
