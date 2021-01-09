//
//  WrappableTextField.swift
//  WrappableTextField
//
//  Created by Aaron Lee on 2020-11-27.
//

import UIKit

class WrappableTextField: UITextField, UITextFieldDelegate {
    
    var onEditing: ((String) -> Void)?
    var onCommitted: (() -> Void)?
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let next = textField.superview?.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            next.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let value = textField.text as NSString? {
            let newValue = value.replacingCharacters(in: range, with: string)
            onEditing?(newValue as String)
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        onCommitted?()
    }
    
}
