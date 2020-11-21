//
//  DismissKeyboardHelper.swift
//  My Reminder
//
//  Created by Aaron Lee on 2020-11-22.
//

import UIKit

final class DismissKeyboardHelper {
    static func dismiss() {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .map { $0 as? UIWindowScene }
            .compactMap { $0 }
            .first?.windows
            .filter { $0.isKeyWindow }
            .first
        
        keyWindow?.endEditing(true)
    }
}
