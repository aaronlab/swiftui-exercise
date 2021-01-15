//
//  PageOne.swift
//  TabPages
//
//  Created by Aaron Lee on 2021/01/15.
//

import SwiftUI

struct PageOne: View {
    var body: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            
            Text("One")
                .foregroundColor(.white)
        }
    }
}

struct PageOne_Previews: PreviewProvider {
    static var previews: some View {
        PageOne()
    }
}
