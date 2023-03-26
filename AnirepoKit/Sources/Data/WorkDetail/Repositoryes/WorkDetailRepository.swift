//
//  File.swift
//  
//
//  Created by Takahashi Tsubasa on 2023/03/26.
//

import Foundation
import GraphQLCore

public protocol WorkDetailRepository {
    func fetch(annictId: Int) async -> WorkDetail?
}

public struct ApolloWorkDetailRepository: WorkDetailRepository {
    
    public init() {}
    
    public func fetch(annictId: Int) async -> WorkDetail? {
        do {
            let result = try await AnnictClient.shared.apollo.fetch(query: Annict.WorkDetailQuery(annictIds: [annictId]))
            guard let node = result.data?.searchWorks?.edges?.first??.node else { return nil }
            let seriesList: [WorkDetail.Series] = {
                guard let edges = node.seriesList?.edges?.first??.node?.works?.edges else { return [] }
                return edges.compactMap { edge in
                    guard let item = edge?.item else { return nil }
                    return WorkDetail.Series(annictId: item.annictId, title: item.title)
                }
            }()
            let episodes: [WorkDetail.Episode] = {
                guard let edges = node.episodes?.edges else { return [] }
                return edges.compactMap { edge in
                    guard let node = edge?.node else { return nil }
                    return WorkDetail.Episode(number: node.number,
                                              numberText: node.numberText,
                                              title: node.title,
                                              satisfactionRate: node.satisfactionRate)
                }
            }()
            let casts: [WorkDetail.Cast] = {
                guard let edges = node.casts?.edges else { return [] }
                return edges.compactMap { edge in
                    guard let node = edge?.node else { return nil }
                    return WorkDetail.Cast(annictId: node.annictId,
                                           name: node.name,
                                           nameEn: node.nameEn,
                                           characterName: node.character.name,
                                           characterNameEn: node.character.nameEn)
                }
            }()
            let staffs: [WorkDetail.Staff] = {
                guard let edges = node.staffs?.edges else { return [] }
                return edges.compactMap { edge in
                    guard let node = edge?.node else { return nil }
                    return WorkDetail.Staff(name: node.name,
                                            roleText: node.roleText,
                                            roleOtherText: node.roleOther)
                }
            }()
            let workDetail: WorkDetail = WorkDetail(annictId: node.annictId,
                                                    title: node.title,
                                                    titleEn: node.titleEn,
                                                    titleKana: node.titleKana,
                                                    seasonYear: node.seasonYear,
                                                    season: WorkDetail.Season(rawValue: node.seasonName?.rawValue ?? ""),
                                                    media: WorkDetail.Media(rawValue: node.media.rawValue),
                                                    episodesCount: node.episodesCount,
                                                    officialSiteUrlString: node.officialSiteUrl,
                                                    wikipediaUrlString: node.wikipediaUrl,
                                                    wikipediaEnUrlString: node.wikipediaUrlEn,
                                                    twitterUserName: node.twitterUsername,
                                                    twitterHashTag: node.twitterHashtag,
                                                    watchersCount: node.watchersCount,
                                                    reviewsCount: node.reviewsCount,
                                                    thumbnailUrlString: node.image?.recommendedImageUrl,
                                                    copyright: node.image?.copyright,
                                                    seriesList: seriesList,
                                                    episodes: episodes,
                                                    casts: casts,
                                                    staffs: staffs)
            return workDetail
        } catch {
            return nil
        }
    }
    
}

