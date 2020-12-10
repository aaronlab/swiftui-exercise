//
//  UIView+Extension.swift
//  test
//
//  Created by Aaron Lee on 2020/12/10.
//

import UIKit

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        self.navigationController?.navigationItem.leftBarButtonItems = nil
        
        return viewControllers.count > 1
    }
}
