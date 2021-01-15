//
//  PageTwo.swift
//  TabPages
//
//  Created by Aaron Lee on 2021/01/15.
//

import SwiftUI

struct PageTwo: View {
    var body: some View {
        ZStack {
            Color.orange.edgesIgnoringSafeArea(.all)
            
            Text("Two")
                .foregroundColor(.white)
        }
    }
}

struct PageTwo_Previews: PreviewProvider {
    static var previews: some View {
        PageTwo()
    }
}
