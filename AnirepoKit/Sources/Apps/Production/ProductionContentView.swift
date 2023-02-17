//
//  File.swift
//  
//
//  Created by Takahashi Tsubasa on 2023/02/16.
//

import SwiftUI
import Routing
import TimelineFeature
import RecordFeature
import SearchFeature

@MainActor
struct RouteProvider: RoutingProvider {
    
    nonisolated init() {}
    
    @ViewBuilder
    func route(for target: any Routing) -> some View {
        switch target {
        case _ as Routings.Timeline:
            EmptyView()
        default:
            Text("unknown routing: \(String(describing: target))")
        }
    }
    
}

class AppDelegate: NSObject, UIApplicationDelegate {
    private(set) lazy var router = Router(provider: RouteProvider())
}

public struct ContentView: View {
    
    @UIApplicationDelegateAdaptor var appDelegate: AppDelegate
    
    public init() {}
    
    public var body: some View {
        TabView{
            TimelineScreen()
                .tabItem {
                    Image(systemName: "1.circle.fill")
                }
            RecordListScreen()
                .tabItem {
                    Image(systemName: "2.circle.fill")
                }
            SearchScreen()
                .tabItem {
                    Image(systemName: "3.circle.fill")
                }
        }
        .environment(\.router, appDelegate.router)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

