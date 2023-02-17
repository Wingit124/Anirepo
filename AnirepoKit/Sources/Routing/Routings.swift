//
//  File.swift
//  
//
//  Created by Takahashi Tsubasa on 2023/02/16.
//

import Foundation

public enum Routings {
    
    public struct Timeline: Routing {
        public init() {}
    }

}

extension Routing where Self == Routings.Timeline {
    public static func timeline() -> Routings.Timeline { self.init() }
}
