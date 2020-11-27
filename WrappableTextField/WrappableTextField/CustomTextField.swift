//
//  CustomTextField.swift
//  WrappableTextField
//
//  Created by Aaron Lee on 2020-11-27.
//

import SwiftUI

struct CustomTextField: UIViewRepresentable {
    
    private let tempView = WrappableTextField()
    var tag: Int = 0
    
    var placeholder: String?
    var onEditing: ((String) -> Void)?
    var onCommitted: (() -> Void)?
    
    func makeUIView(context: UIViewRepresentableContext<CustomTextField>) -> WrappableTextField {
        tempView.tag = tag
        tempView.delegate = tempView
        tempView.placeholder = placeholder
        tempView.onEditing = onEditing
        tempView.onCommitted = onCommitted
        return tempView
    }
    
    func updateUIView(_ uiView: WrappableTextField, context: UIViewRepresentableContext<CustomTextField>) {
        uiView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        uiView.setContentHuggingPriority(.defaultLow, for: .horizontal)
    }
    
}
