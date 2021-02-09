//
//  Functions.swift
//  Copyright © 2020 Alexander Andriushchenko. All rights reserved.
//

import UIKit

enum F { 
    
    static func nibNamefor(_ vcType: UIViewController.Type) -> String {
        let nibName = "\(vcType)"
            .components(separatedBy: ".")
            .first
            .map { $0.prefix { $0 != "<" } }
            .map(String.init)
        return nibName ?? Self.toString(vcType)
    }
    
    static func toString(_ anyClass: Any) -> String {
        return .init(describing: anyClass)
    }
    
    static func Log<T>(_ object: T) {
        print(object)
    }
}
