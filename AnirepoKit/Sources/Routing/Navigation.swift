//
//  File.swift
//  
//
//  Created by Takahashi Tsubasa on 2023/03/27.
//

import SwiftUI

public final class Navigation: ObservableObject {
    
    @Published public var path = NavigationPath()
    
    public init() {}
    
    public func push(to routing: any Routing) {
        self.path.append(routing)
    }
    
}

extension EnvironmentValues {
    private struct Key: EnvironmentKey {
        static var defaultValue: Navigation {
            Navigation()
        }
    }

    public var navigation: Navigation {
        get { self[Key.self] }
        set { self[Key.self] = newValue }
    }
}
