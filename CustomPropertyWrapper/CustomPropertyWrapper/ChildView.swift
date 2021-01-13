//
//  ChildView.swift
//  CustomPropertyWrapper
//
//  Created by Aaron Lee on 2021/01/13.
//

import SwiftUI

struct ChildView: View {
    
    let user = User()
    
    var body: some View {
        VStack {
            
            Text(user.name)
            Text(user.userId)
        }
    }
    
}
