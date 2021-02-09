//
//  NetworkRouter.swift
//  Copyright © 2020 Alexander Andriushchenko. All rights reserved.
//

import Foundation

protocol NetworkRouter: class {
    associatedtype EndPoint: EndPointType
    func request<T: Codable>(_ route: EndPoint, completion: @escaping (Result<T, NetworkError>) -> Void)

}
