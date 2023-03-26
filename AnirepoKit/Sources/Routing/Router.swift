//
//  File.swift
//  
//
//  Created by Takahashi Tsubasa on 2023/02/16.
//

import SwiftUI

public protocol Routing: Hashable {}

public protocol RoutingProvider {
    associatedtype ResultView: View

    @MainActor
    @ViewBuilder
    func route(for target: any Routing) -> ResultView
}

public struct Router: Sendable {
    
    let router: @Sendable @MainActor (any Routing) -> AnyView

    @MainActor
    public func route(for target: some Routing) -> some View {
        router(target)
    }
}

extension Router {
    public init<Provider: RoutingProvider>(provider: Provider) {
        let route = provider.route(for:)
        router = { target in
            AnyView(route(target))
        }
    }
}

extension EnvironmentValues {
    private struct Key: EnvironmentKey {
        static var defaultValue: Router {
            Router { _ in
                AnyView(EmptyView())
            }
        }
    }

    public var router: Router {
        get { self[Key.self] }
        set { self[Key.self] = newValue }
    }
}
