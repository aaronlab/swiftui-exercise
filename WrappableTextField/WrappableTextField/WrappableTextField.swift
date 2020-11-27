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
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
}
