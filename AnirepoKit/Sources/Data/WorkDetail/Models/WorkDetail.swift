//
//  File.swift
//  
//
//  Created by Takahashi Tsubasa on 2023/03/26.
//

import Foundation

public struct WorkDetail: Identifiable {
    
    public let id: UUID = UUID()
    public let annictId: Int
    public let title: String
    public let titleEn: String?
    public let titleKana: String?
    public let seasonYear: Int?
    public let season: Season?
    public let media: Media?
    public let episodesCount: Int
    let officialSiteUrlString: String?
    let wikipediaUrlString: String?
    let wikipediaEnUrlString: String?
    public let twitterUserName: String?
    public let twitterHashTag: String?
    public let watchersCount: Int
    public let reviewsCount: Int
    let thumbnailUrlString: String?
    public let copyright: String?
    public let seriesList: [Series]
    public let episodes: [Episode]
    public let casts: [Cast]
    public let staffs: [Staff]
    
    public enum Season: String {
      case winter = "WINTER"
      case spring = "SPRING"
      case summer = "SUMMER"
      case autumn = "AUTUMN"
    }
    
    public enum Media: String {
      case tv = "TV"
      case ova = "OVA"
      case movie = "MOVIE"
      case web = "WEB"
      case other = "OTHER"
    }
    
    public struct Series: Identifiable {
        public let id: UUID = UUID()
        public let annictId: Int
        public let title: String
    }
    
    public struct Episode: Identifiable {
        public let id: UUID = UUID()
        public let number: Int?
        public let numberText: String?
        public let title: String?
        public let satisfactionRate: Double?
    }
    
    public struct Cast: Identifiable {
        public let id: UUID = UUID()
        public let annictId: Int
        public let name: String
        public let nameEn: String
        public let characterName: String
        public let characterNameEn: String
    }
    
    public struct Staff: Identifiable {
        public let id: UUID = UUID()
        public let name: String
        public let roleText: String
        public let roleOtherText: String
    }
    
    
    public var thumbnailUrl: URL? {
        guard let thumbnailUrlString = thumbnailUrlString,
              let url = URL(string: thumbnailUrlString) else { return nil }
        return url
    }
    
}

#if DEBUG
extension WorkDetail {
    
    public static var preview: Self {
        let workDetail = WorkDetail(annictId: 1,
                                    title: "異世界であーだこーだ",
                                    titleEn: "Isekai de A-da Ko-da",
                                    titleKana: "いせかいであーだーこーだ",
                                    seasonYear: 2020,
                                    season: .spring,
                                    media: .tv,
                                    episodesCount: 12,
                                    officialSiteUrlString: "https://www.google.com",
                                    wikipediaUrlString: "https://ja.wikipedia.org/wiki/",
                                    wikipediaEnUrlString: "https://en.wikipedia.org/wiki/",
                                    twitterUserName: "win9y",
                                    twitterHashTag: "異世界",
                                    watchersCount: 1000,
                                    reviewsCount: 100,
                                    thumbnailUrlString: "https://placehold.jp/250x150.png",
                                    copyright: "©︎win9y",
                                    seriesList: [
                                        Series(annictId: 1, title: "異世界であーだこーだ"),
                                        Series(annictId: 2, title: "異世界であーだこーだ 2nd"),
                                    ],
                                    episodes: [
                                        Episode(number: 1, numberText: "エピソード1", title: "サブタイ1", satisfactionRate: 98.1),
                                        Episode(number: 2, numberText: "エピソード2", title: "サブタイ1", satisfactionRate: 98.2),
                                        Episode(number: 3, numberText: "エピソード3", title: "サブタイ1", satisfactionRate: 98.3),
                                        Episode(number: 4, numberText: "エピソード4", title: "サブタイ1", satisfactionRate: 98.4),
                                        Episode(number: 5, numberText: "エピソード5", title: "サブタイ1", satisfactionRate: 98.5),
                                        Episode(number: 6, numberText: "エピソード6", title: "サブタイ1", satisfactionRate: 98.6),
                                        Episode(number: 7, numberText: "エピソード7", title: "サブタイ1", satisfactionRate: 98.7),
                                        Episode(number: 8, numberText: "エピソード8", title: "サブタイ1", satisfactionRate: 98.8),
                                        Episode(number: 9, numberText: "エピソード9", title: "サブタイ1", satisfactionRate: 98.9),
                                        Episode(number: 10, numberText: "エピソード10", title: "サブタイ1", satisfactionRate: 99.0),
                                        Episode(number: 11, numberText: "エピソード11", title: "サブタイ1", satisfactionRate: 99.1),
                                        Episode(number: 12, numberText: "エピソード12", title: "サブタイ1", satisfactionRate: 99.2)
                                    ],
                                    casts: [
                                        Cast(annictId: 1, name: "声優1", nameEn: "VoiceActor1", characterName: "キャラクター1", characterNameEn: "Character1"),
                                        Cast(annictId: 2, name: "声優2", nameEn: "VoiceActor2", characterName: "キャラクター2", characterNameEn: "Character2"),
                                        Cast(annictId: 3, name: "声優3", nameEn: "VoiceActor3", characterName: "キャラクター3", characterNameEn: "Character3")
                                    ],
                                    staffs: [
                                        Staff(name: "スタッフ1", roleText: "作画監督", roleOtherText: ""),
                                        Staff(name: "スタッフ2", roleText: "監督", roleOtherText: ""),
                                        Staff(name: "スタッフ3", roleText: "アニメーション制作", roleOtherText: "")
                                    ])
        return workDetail
    }
    
}
#endif
