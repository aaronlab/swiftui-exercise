//
//  AlertView.swift
//  AlertTextField
//
//  Created by Aaron Lee on 2021/01/16.
//

import SwiftUI

struct AlertView: UIViewControllerRepresentable {
    
    @Binding var text: String
    @Binding var showAlert: Bool
    
    var title: String
    var message: String
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<AlertView>) -> UIViewController {
        return UIViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        guard context.coordinator.alert == nil else { return }
        
        if self.showAlert {
            
            let alert = UIAlertController(title: self.title, message: self.message, preferredStyle: .alert)
            context.coordinator.alert = alert
            
            alert.addTextField { textField in
                textField.placeholder = "Text here"
                textField.text = self.text
                textField.delegate = context.coordinator
            }
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .destructive) { _ in
                
                alert.dismiss(animated: true) {
                    self.showAlert = false
                }
            })
            
            alert.addAction(UIAlertAction(title: "Submit", style: .default) { _ in
                
                if let textField = alert.textFields?.first, let text = textField.text {
                    self.text = text
                }
                
                alert.dismiss(animated: true) {
                    self.showAlert = false
                }
            })
            
            DispatchQueue.main.async {
                uiViewController.present(alert, animated: true) {
                    self.showAlert = false
                    context.coordinator.alert = nil
                }
            }
            
        }
    }
    
}

extension AlertView {
    
    func makeCoordinator() -> AlertView.Coordinator {
        return Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var alert: UIAlertController?
        var control: AlertView
        
        init(_ control: AlertView) {
            self.control = control
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if let text = textField.text as NSString? {
                self.control.text = text.replacingCharacters(in: range, with: string)
            } else {
                self.control.text = ""
            }
            return true
        }
        
    }
    
}
