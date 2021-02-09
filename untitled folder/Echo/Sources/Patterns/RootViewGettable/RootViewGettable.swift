//
//  File.swift
//  Copyright © 2020 Alexander Andriushchenko. All rights reserved.
//

import UIKit

protocol RootViewGettable {
    associatedtype RootViewType: UIView
    var rootView: RootViewType? { get }
}

extension RootViewGettable where Self: UIViewController {
    var rootView: RootViewType? {
        return self.viewIfLoaded as? RootViewType
    }
}
