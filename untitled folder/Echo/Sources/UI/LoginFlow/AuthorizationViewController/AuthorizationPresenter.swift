//
//  AuthorizationPresentationService.swift
//  Copyright © 2020 Alexander Andriushchenko. All rights reserved.
//
import Foundation
import CoreData

enum AuthEvent: EventProtocol {
    case login
    case signup
    case error(AppError)
}

typealias Handler<T> = (T) -> Void

protocol AuthorizationNetworkManager {
    func login(with model: LoginModel, complition: @escaping Handler<Result<String, NetworkError>>)
}

protocol AuthorizationPresenter: Presenter {
    var showActivity: Handler<ActivityState>? { get set }
    func onLogin(email: String, password: String)
    func onSignup()
}

final class AuthorizationPresenterImpl: AuthorizationPresenter {
    
    // MARK: - Private properties
    
    private let networking: AuthorizationNetworkManager
    let eventHandler: Handler<AuthEvent>
    var showActivity: Handler<ActivityState>?
    
    // MARK: - Init and deinit
    
    init(networking: AuthorizationNetworkManager, event: @escaping Handler<AuthEvent>) {
        self.networking = networking
        self.eventHandler = event
    }
    
    // MARK: - Public Methods
    
    func onLogin(email: String, password: String) {
        let model = LoginModel(email: email, password: password)
        self.showActivity?(.show)
        self.networking.login(with: model) { [weak self] result in
            switch result {
            case.success(let model):
                self?.eventHandler(.login)
            case .failure(let error):
                self?.eventHandler(.error(.networkingError(error)))
            }
        }
    }
    
    func onSignup() {
        self.eventHandler(.signup)
    }
}
