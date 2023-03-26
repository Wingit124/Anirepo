//
//  File.swift
//  
//
//  Created by Takahashi Tsubasa on 2023/03/20.
//

import Foundation
import GraphQLCore

public protocol SearchRepository {
    func search(title: String) async -> [Work]
}

public struct ApolloSearchRepository: SearchRepository {
    
    public init() {}
    
    public func search(title: String) async -> [Work] {
        do {
            let result = try await AnnictClient.shared.apollo.fetch(query: Annict.SearchWorksQuery(titles: [title], seasons: []))
            guard let edges = result.data?.searchWorks?.edges else { return [] }
            let works: [Work] = edges.compactMap { edge in
                guard let node = edge?.node else { return nil }
                return Work(annictId: node.annictId, title: node.title, thumbnailUrlString: node.image?.recommendedImageUrl)
            }
            return works
        } catch {
            return []
        }
    }
    
}
