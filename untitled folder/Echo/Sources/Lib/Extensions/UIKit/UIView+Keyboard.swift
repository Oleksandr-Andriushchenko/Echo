//
//  UIView+Keyboard.swift
//  Copyright © 2020 Alexander Andriushchenko. All rights reserved.
//

import Foundation

import UIKit

extension UIView {
    func hideKeyboardGeasture(_ cancelsTouches: Bool = false) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
        tapGesture.cancelsTouchesInView = cancelsTouches
        self.addGestureRecognizer(tapGesture)
    }

    @objc private func hideKeyboard() {
        self.endEditing(true)
    }
}
