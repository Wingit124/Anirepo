//
//  File.swift
//  
//
//  Created by Takahashi Tsubasa on 2023/03/20.
//

import Foundation

public struct Work: Identifiable {
    
    public let id: UUID = UUID()
    public let annictId: Int
    public let title: String
    let thumbnailUrlString: String?
    
    public var thumbnailUrl: URL? {
        guard let thumbnailUrlString = thumbnailUrlString,
              let url = URL(string: thumbnailUrlString) else { return nil }
        return url
    }
    
}

#if DEBUG
extension Work {
    
    public static var preview: Self {
        let work = Work(annictId: 1, title: "異世界であーだこーだ", thumbnailUrlString: "https://placehold.jp/250x150.png")
        return work
    }
    
}
#endif
