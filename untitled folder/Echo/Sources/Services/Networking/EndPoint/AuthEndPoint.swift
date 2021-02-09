//
//  AuthEndPoint.swift
//  Copyright © 2020 Alexander Andriushchenko. All rights reserved.
//

import Foundation

extension APIEndPoint {
    
    enum AuthEndPoint: EndPointType {
        case login(model: LoginModel)
        case signup(model: SignupModel)
        case logout
        
        var base: String {
            return "https://apiecho.cf"
        }
        
        var baseURL: URL {
            guard let url = URL(string: base) else { fatalError("baseURL could not be configured.")}
            return url
        }
        
        var path: String {
            switch self {
            case .login:
                return "/api/login/"
            case .signup:
                return "/api/signup/"
            case .logout:
                return "/api/logout/"
            }
        }
        
        var httpMethod: HTTPMethod {
            return .post
        }
        
        var task: HTTPTask {
            switch self {
            case .login(let model):
                return .requestParam(model: model, urlParameters: nil)
            case .signup(let model):
                return .requestParam(model: model, urlParameters: nil)
            case .logout:
                return .request
            }
        }
    }
}
