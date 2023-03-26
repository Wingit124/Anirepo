//
//  File.swift
//  
//
//  Created by Takahashi Tsubasa on 2023/02/16.
//

import Foundation

public enum Routings {
    
    public struct Search: Routing {
        public init() {}
    }
    
    public struct WorkDetail: Routing {
        public let annictId: Int
        public init(annictId: Int) {
            self.annictId = annictId
        }
    }

}

extension Routing where Self == Routings.Search {
    public static func search() -> Routings.Search { self.init() }
}

extension Routing where Self == Routings.WorkDetail {
    public static func workDetail(annictId: Int) -> Routings.WorkDetail { self.init(annictId: annictId) }
}
