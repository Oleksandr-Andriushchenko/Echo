//
//  AppErrorPresentable.swift
//  Copyright © 2020 Alexander Andriushchenko. All rights reserved.
//

/// Interfase to handle app events (AppEvent)
protocol AppEventSource {
    var eventHandler: (AppEvent) -> Void { get }
}
