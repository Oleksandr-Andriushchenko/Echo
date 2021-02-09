//
//  HTTPTask.swift
//  
//  Copyright © 2020 Alexander Andriushchenko. All rights reserved.
//

import Foundation

typealias HTTPHeaders = [String: String]

enum HTTPTask {
    case request
    case requestParam(model: Codable?,
        urlParameters: Parameters?)
    case requestParamAndHeaders(model: Codable?,
        urlParameters: Parameters?,
        additionHeaders: HTTPHeaders?)
    case requestParameters(bodyParameters: Parameters?,
        urlParameters: Parameters?)
    case requestParametersAndHeaders(bodyParameters: Parameters?,
        urlParameters: Parameters?,
        additionHeaders: HTTPHeaders?)
}
