//
//  EndPointType.swift
//  Copyright © 2020 Alexander Andriushchenko. All rights reserved.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
}
