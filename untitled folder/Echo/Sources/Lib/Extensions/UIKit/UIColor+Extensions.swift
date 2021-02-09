//
//  UIColor+Extensions.swift
//  Copyright © 2020 Alexander Andriushchenko. All rights reserved.
//

import UIKit

enum AppColor: String {
    case primary
}

extension UIColor {
    convenience init?(named name: AppColor) {
        self.init(named: name.rawValue)
    }
}
