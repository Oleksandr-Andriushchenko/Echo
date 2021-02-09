//
//  NetworkManager.swift
//  Copyright © 2020 Alexander Andriushchenko. All rights reserved.
//

import Foundation

protocol NetworkManager: AuthorizationNetworkManager {}

class NetworkManagerImpl: NetworkManager {

    // MARK: - Properties
    
    private let networkRouter = NetworkRouterImpl<APIEndPoint>(networkService: NetworkServiceImpl())
    
    
    // MARK: - Networking methods
    // MARK: - Authorization requests
    
    func login(with model: LoginModel, complition: @escaping Handler<Result<String, NetworkError>>) {
        self.networkRouter.request(.auth(.login(model: model)), completion: complition)
    }

}
