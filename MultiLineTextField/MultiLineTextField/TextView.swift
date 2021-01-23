//
//  TextView.swift
//  MultiLineTextField
//
//  Created by Aaron Lee on 2021/01/23.
//

import SwiftUI

struct TextView: UIViewRepresentable {
    
    @Binding var text: String
    
    init(text: Binding<String>) {
        self._text = text
    }
    
    func makeUIView(context: UIViewRepresentableContext<TextView>) -> UITextView {
        let textView = UITextView(frame: .zero)
        textView.textAlignment = .left
        textView.textColor = .red
        textView.backgroundColor = .lightGray
        
        // MARK: - MARKMARKMARKMARKMARKMARKMARKMARKMARKMARKMARKMARK
        textView.delegate = context.coordinator
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<TextView>) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        
        @Binding var text: String
        
        init(text: Binding<String>) {
            self._text = text
        }
        
        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            if let text = textView.text,
               let textRange = Range(range, in: text) {
                let updatedText = text.replacingCharacters(in: textRange, with: text)
                print(updatedText)
            }
            return true
        }
        
    }
    
}
