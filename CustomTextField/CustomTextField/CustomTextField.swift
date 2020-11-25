//
//  CustomTextField.swift
//  CustomTextField
//
//  Created by Aaron Lee on 2020-11-25.
//

import SwiftUI

struct CustomTextField: UIViewRepresentable {
    
    @Binding var text: String
    var isFirstResponder: Bool = false
    var placeholder: String = ""
    
    private let textField = UITextField(frame: .zero)
    
    func makeUIView(context: Context) -> UITextField {
        textField.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        textField.delegate = context.coordinator
        textField.placeholder = placeholder
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
        if isFirstResponder && !context.coordinator.didBecomeFirstResponder {
            uiView.becomeFirstResponder()
            context.coordinator.didBecomeFirstResponder = true
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        
        @Binding var text: String
        var didBecomeFirstResponder: Bool = false
        
        init(text: Binding<String>) {
            self._text = text
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
        
    }
    
}

extension CustomTextField {
    
    func customForegroundColor(_ color: UIColor) -> CustomTextField {
        self.textField.textColor = color
        return self
    }
    
    func customFont(_ font: UIFont) -> CustomTextField {
        self.textField.font = font
        return self
    }
    
}
