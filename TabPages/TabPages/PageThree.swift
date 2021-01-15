//
//  PageThree.swift
//  TabPages
//
//  Created by Aaron Lee on 2021/01/15.
//

import SwiftUI

struct PageThree: View {
    var body: some View {
        ZStack {
            Color.gray
            
            Text("Three")
                .foregroundColor(.white)
        }
    }
}

struct PageThree_Previews: PreviewProvider {
    static var previews: some View {
        PageThree()
    }
}
