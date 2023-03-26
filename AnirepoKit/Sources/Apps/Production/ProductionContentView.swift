//
//  File.swift
//  
//
//  Created by Takahashi Tsubasa on 2023/02/16.
//

import SwiftUI
import Routing
import SearchFeature
import WorkDetailFeature

@MainActor
struct RouteProvider: RoutingProvider {
    
    nonisolated init() {}
    
    @ViewBuilder
    func route(for target: any Routing) -> some View {
        switch target {
        case _ as Routings.Search:
            SearchScreen()
        case let workDetail as Routings.WorkDetail:
            WorkDetailScreen(annictId: workDetail.annictId)
        default:
            Text("unknown routing: \(String(describing: target))")
        }
    }
    
}

class AppDelegate: NSObject, UIApplicationDelegate {
    private(set) lazy var router = Router(provider: RouteProvider())
}

public struct ContentView: View {
    
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    @StateObject private var navigation = Navigation()
    
    public init() {}
    
    public var body: some View {
        NavigationStack(path: $navigation.path) {
            SearchScreen()
                .navigationDestination(for: Routings.Search.self) { search in
                    appDelegate.router.route(for: search)
                }
                .navigationDestination(for: Routings.WorkDetail.self) { workDetail in
                    appDelegate.router.route(for: workDetail)
                }
        }
        .environment(\.navigation, navigation)
        .environment(\.router, appDelegate.router)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

