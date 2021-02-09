//
//  MovieEndPoint.swift
//  Copyright © 2020 Alexander Andriushchenko. All rights reserved.
//

import Foundation

enum APIEndPoint {
    case auth(AuthEndPoint)
}

extension APIEndPoint: EndPointType {
    var httpMethod: HTTPMethod {
        switch self {
        case .auth(let model): return model.httpMethod
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .auth(let model): return model.task
        }
    }
    
    var base: String {
        return "https://apiecho.cf"
    }
    
    var baseURL: URL {
        guard let url = URL(string: base) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .auth(let model): return model.path
        }
    }
}
