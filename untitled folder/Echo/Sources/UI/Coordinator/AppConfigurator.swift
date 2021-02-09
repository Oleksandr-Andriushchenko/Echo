//
//  AppConfigurator.swift

//  Copyright © 2019 Alexander Andriushchenko. All rights reserved.
//

import UIKit

enum AppEvent {
    case mainFlow
    case authorizationFlow
    case appError(AppError)
}

enum ActivityState {
    case show
    case hide
}

final class AppConfigurator {
    
    // MARK: - Private properties
    
    private let window: UIWindow
    private let networking = NetworkManagerImpl()
    
    // MARK: - Init
    
    init(window: UIWindow) {
        self.window = window
        self.configure()
    }
    
    // MARK: - Private methods
    
    private func configure() {
        
        if KeyChainContainer.sessionID?.isEmpty == false {
            
        } else {
            
        }
        self.window.makeKeyAndVisible()
    }

    
    private func appEvent(_ event: AppEvent) {
        switch event {
        case .mainFlow:
            print()
        case .authorizationFlow:
            print()
        case .appError(let error):
            self.handleAppError(error)
        }
    }
    
    private func handleAppError(_ event: AppError) {
        switch event {
        case .networkingError(let error):
            self.showAlert(with: error)
        case .unowned(let error):
            self.window.rootViewController?.showAlert(title: TextConstants.appError,
                                                      message: error.debugDescription)
        case .emptySearchResult:
            self.window.rootViewController?.showAlert(title: TextConstants.searchErrorTitle,
                                                      message: TextConstants.searchErrorMessage)
        }
    }
    
    private func networkError(_ error: NetworkError) {
        switch error {
        case .networkingResponse(let nError):
            if .authenticationError == nError {
                self.appEvent(.authorizationFlow)
            }
            self.showAlert(with: error)
        default:
            self.showAlert(with: error)
        }
    }
    
    private func showAlert(with error: NetworkError) {
        self.window.rootViewController?.showAlert(title: TextConstants.serverError,
                                                  message: error.stringDescription)
    }
}
