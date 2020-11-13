//
//  ScannerView.swift
//  CardNumberOCRExample
//
//  Created by Aaron Lee on 2020-11-13.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    @Binding var navigationStatus: NavigationStatus?
    @Binding var result: CreditCard?
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let vc = CreditCardScannerViewController(delegate: context.coordinator)
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    class Coordinator: NSObject, CreditCardScannerViewControllerDelegate {
        
        @Binding var navigationStatus: NavigationStatus?
        @Binding var result: CreditCard?
        
        init(navigationStatus: Binding<NavigationStatus?>, result: Binding<CreditCard?>) {
            _navigationStatus = navigationStatus
            _result = result
        }
        
        func creditCardScannerViewControllerDidCancel(_ viewController: CreditCardScannerViewController) {
            print("Canceled")
        }
        
        func creditCardScannerViewController(_ viewController: CreditCardScannerViewController, didErrorWith error: CreditCardScannerError) {
            print(error)
        }
        
        func creditCardScannerViewController(_ viewController: CreditCardScannerViewController, didFinishWith card: CreditCard) {
            print("==================================================")
            print("Name: \(card.name ?? "N/A")\nCard Number: \(card.number ?? "N/A")\nExpire Year: \(card.expireDate?.year ?? 00)\nExpire Month: \(card.expireDate?.month ?? 0)")
            print("==================================================")
            result = card
            navigationStatus = .pop
        }
        
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(navigationStatus: $navigationStatus, result: $result)
    }
    
}
