//
//  TabBarButton.swift
//  Custom-Navbar
//
//  Created by Aaron Lee on 2020-10-31.
//

import SwiftUI

struct TabBarButton: View {
    @Binding var current: String
    var image: String
    var animation: Namespace.ID
    
    var body: some View {
        
        Button(action: {
            withAnimation {
                current = image
            }
        }) {
            VStack(spacing: 5) {
                
                Image(systemName: image)
                    .font(.title2)
                    .foregroundColor(current == image ? Color.blue : Color.black.opacity(0.3))
                // Default Frame to Avoid resizing
                    .frame(height: 35)
                
                ZStack {
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 4)
                    
                    // Matched Geometry Effect Slide Animation
                    
                    if current == image {
                        
                        Rectangle()
                            .fill(Color.blue)
                            .frame(height: 4)
                            .matchedGeometryEffect(id: "Tab", in: animation)
                        
                    }
                    
                }
                
            }
        }
        
    }
}

//struct TabBarButton_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarButton()
//    }
//}
