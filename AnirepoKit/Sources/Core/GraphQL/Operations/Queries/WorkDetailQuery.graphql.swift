// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension Annict {
  class WorkDetailQuery: GraphQLQuery {
    public static let operationName: String = "WorkDetail"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query WorkDetail($annictIds: [Int!]!) {
          searchWorks(annictIds: $annictIds, first: 1) {
            __typename
            edges {
              __typename
              node {
                __typename
                annictId
                title
                titleEn
                titleKana
                seasonYear
                seasonName
                media
                episodesCount
                officialSiteUrl
                wikipediaUrl
                wikipediaUrlEn
                twitterUsername
                twitterHashtag
                watchersCount
                reviewsCount
                image {
                  __typename
                  recommendedImageUrl
                  copyright
                }
                seriesList {
                  __typename
                  edges {
                    __typename
                    node {
                      __typename
                      works {
                        __typename
                        edges {
                          __typename
                          item {
                            __typename
                            annictId
                            title
                          }
                        }
                      }
                    }
                  }
                }
                episodes(orderBy: {field: SORT_NUMBER, direction: ASC}) {
                  __typename
                  edges {
                    __typename
                    node {
                      __typename
                      number
                      numberText
                      title
                      satisfactionRate
                    }
                  }
                }
                casts {
                  __typename
                  edges {
                    __typename
                    node {
                      __typename
                      annictId
                      name
                      nameEn
                      character {
                        __typename
                        name
                        nameEn
                      }
                    }
                  }
                }
                staffs(orderBy: {field: SORT_NUMBER, direction: DESC}) {
                  __typename
                  edges {
                    __typename
                    node {
                      __typename
                      name
                      roleText
                      roleOther
                    }
                  }
                }
              }
            }
          }
        }
        """#
      ))

    public var annictIds: [Int]

    public init(annictIds: [Int]) {
      self.annictIds = annictIds
    }

    public var __variables: Variables? { ["annictIds": annictIds] }

    public struct Data: Annict.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ApolloAPI.ParentType { Annict.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("searchWorks", SearchWorks?.self, arguments: [
          "annictIds": .variable("annictIds"),
          "first": 1
        ]),
      ] }

      public var searchWorks: SearchWorks? { __data["searchWorks"] }

      /// SearchWorks
      ///
      /// Parent Type: `WorkConnection`
      public struct SearchWorks: Annict.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { Annict.Objects.WorkConnection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("edges", [Edge?]?.self),
        ] }

        /// A list of edges.
        public var edges: [Edge?]? { __data["edges"] }

        /// SearchWorks.Edge
        ///
        /// Parent Type: `WorkEdge`
        public struct Edge: Annict.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { Annict.Objects.WorkEdge }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("node", Node?.self),
          ] }

          /// The item at the end of the edge.
          public var node: Node? { __data["node"] }

          /// SearchWorks.Edge.Node
          ///
          /// Parent Type: `Work`
          public struct Node: Annict.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ApolloAPI.ParentType { Annict.Objects.Work }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("annictId", Int.self),
              .field("title", String.self),
              .field("titleEn", String?.self),
              .field("titleKana", String?.self),
              .field("seasonYear", Int?.self),
              .field("seasonName", GraphQLEnum<Annict.SeasonName>?.self),
              .field("media", GraphQLEnum<Annict.Media>.self),
              .field("episodesCount", Int.self),
              .field("officialSiteUrl", String?.self),
              .field("wikipediaUrl", String?.self),
              .field("wikipediaUrlEn", String?.self),
              .field("twitterUsername", String?.self),
              .field("twitterHashtag", String?.self),
              .field("watchersCount", Int.self),
              .field("reviewsCount", Int.self),
              .field("image", Image?.self),
              .field("seriesList", SeriesList?.self),
              .field("episodes", Episodes?.self, arguments: ["orderBy": [
                "field": "SORT_NUMBER",
                "direction": "ASC"
              ]]),
              .field("casts", Casts?.self),
              .field("staffs", Staffs?.self, arguments: ["orderBy": [
                "field": "SORT_NUMBER",
                "direction": "DESC"
              ]]),
            ] }

            public var annictId: Int { __data["annictId"] }
            public var title: String { __data["title"] }
            public var titleEn: String? { __data["titleEn"] }
            public var titleKana: String? { __data["titleKana"] }
            public var seasonYear: Int? { __data["seasonYear"] }
            public var seasonName: GraphQLEnum<Annict.SeasonName>? { __data["seasonName"] }
            public var media: GraphQLEnum<Annict.Media> { __data["media"] }
            public var episodesCount: Int { __data["episodesCount"] }
            public var officialSiteUrl: String? { __data["officialSiteUrl"] }
            public var wikipediaUrl: String? { __data["wikipediaUrl"] }
            public var wikipediaUrlEn: String? { __data["wikipediaUrlEn"] }
            public var twitterUsername: String? { __data["twitterUsername"] }
            public var twitterHashtag: String? { __data["twitterHashtag"] }
            public var watchersCount: Int { __data["watchersCount"] }
            public var reviewsCount: Int { __data["reviewsCount"] }
            public var image: Image? { __data["image"] }
            public var seriesList: SeriesList? { __data["seriesList"] }
            public var episodes: Episodes? { __data["episodes"] }
            public var casts: Casts? { __data["casts"] }
            public var staffs: Staffs? { __data["staffs"] }

            /// SearchWorks.Edge.Node.Image
            ///
            /// Parent Type: `WorkImage`
            public struct Image: Annict.SelectionSet {
              public let __data: DataDict
              public init(data: DataDict) { __data = data }

              public static var __parentType: ApolloAPI.ParentType { Annict.Objects.WorkImage }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("recommendedImageUrl", String?.self),
                .field("copyright", String?.self),
              ] }

              public var recommendedImageUrl: String? { __data["recommendedImageUrl"] }
              public var copyright: String? { __data["copyright"] }
            }

            /// SearchWorks.Edge.Node.SeriesList
            ///
            /// Parent Type: `SeriesConnection`
            public struct SeriesList: Annict.SelectionSet {
              public let __data: DataDict
              public init(data: DataDict) { __data = data }

              public static var __parentType: ApolloAPI.ParentType { Annict.Objects.SeriesConnection }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("edges", [Edge?]?.self),
              ] }

              /// A list of edges.
              public var edges: [Edge?]? { __data["edges"] }

              /// SearchWorks.Edge.Node.SeriesList.Edge
              ///
              /// Parent Type: `SeriesEdge`
              public struct Edge: Annict.SelectionSet {
                public let __data: DataDict
                public init(data: DataDict) { __data = data }

                public static var __parentType: ApolloAPI.ParentType { Annict.Objects.SeriesEdge }
                public static var __selections: [ApolloAPI.Selection] { [
                  .field("node", Node?.self),
                ] }

                /// The item at the end of the edge.
                public var node: Node? { __data["node"] }

                /// SearchWorks.Edge.Node.SeriesList.Edge.Node
                ///
                /// Parent Type: `Series`
                public struct Node: Annict.SelectionSet {
                  public let __data: DataDict
                  public init(data: DataDict) { __data = data }

                  public static var __parentType: ApolloAPI.ParentType { Annict.Objects.Series }
                  public static var __selections: [ApolloAPI.Selection] { [
                    .field("works", Works?.self),
                  ] }

                  public var works: Works? { __data["works"] }

                  /// SearchWorks.Edge.Node.SeriesList.Edge.Node.Works
                  ///
                  /// Parent Type: `SeriesWorkConnection`
                  public struct Works: Annict.SelectionSet {
                    public let __data: DataDict
                    public init(data: DataDict) { __data = data }

                    public static var __parentType: ApolloAPI.ParentType { Annict.Objects.SeriesWorkConnection }
                    public static var __selections: [ApolloAPI.Selection] { [
                      .field("edges", [Edge?]?.self),
                    ] }

                    /// A list of edges.
                    public var edges: [Edge?]? { __data["edges"] }

                    /// SearchWorks.Edge.Node.SeriesList.Edge.Node.Works.Edge
                    ///
                    /// Parent Type: `SeriesWorkEdge`
                    public struct Edge: Annict.SelectionSet {
                      public let __data: DataDict
                      public init(data: DataDict) { __data = data }

                      public static var __parentType: ApolloAPI.ParentType { Annict.Objects.SeriesWorkEdge }
                      public static var __selections: [ApolloAPI.Selection] { [
                        .field("item", Item.self),
                      ] }

                      public var item: Item { __data["item"] }

                      /// SearchWorks.Edge.Node.SeriesList.Edge.Node.Works.Edge.Item
                      ///
                      /// Parent Type: `Work`
                      public struct Item: Annict.SelectionSet {
                        public let __data: DataDict
                        public init(data: DataDict) { __data = data }

                        public static var __parentType: ApolloAPI.ParentType { Annict.Objects.Work }
                        public static var __selections: [ApolloAPI.Selection] { [
                          .field("annictId", Int.self),
                          .field("title", String.self),
                        ] }

                        public var annictId: Int { __data["annictId"] }
                        public var title: String { __data["title"] }
                      }
                    }
                  }
                }
              }
            }

            /// SearchWorks.Edge.Node.Episodes
            ///
            /// Parent Type: `EpisodeConnection`
            public struct Episodes: Annict.SelectionSet {
              public let __data: DataDict
              public init(data: DataDict) { __data = data }

              public static var __parentType: ApolloAPI.ParentType { Annict.Objects.EpisodeConnection }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("edges", [Edge?]?.self),
              ] }

              /// A list of edges.
              public var edges: [Edge?]? { __data["edges"] }

              /// SearchWorks.Edge.Node.Episodes.Edge
              ///
              /// Parent Type: `EpisodeEdge`
              public struct Edge: Annict.SelectionSet {
                public let __data: DataDict
                public init(data: DataDict) { __data = data }

                public static var __parentType: ApolloAPI.ParentType { Annict.Objects.EpisodeEdge }
                public static var __selections: [ApolloAPI.Selection] { [
                  .field("node", Node?.self),
                ] }

                /// The item at the end of the edge.
                public var node: Node? { __data["node"] }

                /// SearchWorks.Edge.Node.Episodes.Edge.Node
                ///
                /// Parent Type: `Episode`
                public struct Node: Annict.SelectionSet {
                  public let __data: DataDict
                  public init(data: DataDict) { __data = data }

                  public static var __parentType: ApolloAPI.ParentType { Annict.Objects.Episode }
                  public static var __selections: [ApolloAPI.Selection] { [
                    .field("number", Int?.self),
                    .field("numberText", String?.self),
                    .field("title", String?.self),
                    .field("satisfactionRate", Double?.self),
                  ] }

                  public var number: Int? { __data["number"] }
                  public var numberText: String? { __data["numberText"] }
                  public var title: String? { __data["title"] }
                  public var satisfactionRate: Double? { __data["satisfactionRate"] }
                }
              }
            }

            /// SearchWorks.Edge.Node.Casts
            ///
            /// Parent Type: `CastConnection`
            public struct Casts: Annict.SelectionSet {
              public let __data: DataDict
              public init(data: DataDict) { __data = data }

              public static var __parentType: ApolloAPI.ParentType { Annict.Objects.CastConnection }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("edges", [Edge?]?.self),
              ] }

              /// A list of edges.
              public var edges: [Edge?]? { __data["edges"] }

              /// SearchWorks.Edge.Node.Casts.Edge
              ///
              /// Parent Type: `CastEdge`
              public struct Edge: Annict.SelectionSet {
                public let __data: DataDict
                public init(data: DataDict) { __data = data }

                public static var __parentType: ApolloAPI.ParentType { Annict.Objects.CastEdge }
                public static var __selections: [ApolloAPI.Selection] { [
                  .field("node", Node?.self),
                ] }

                /// The item at the end of the edge.
                public var node: Node? { __data["node"] }

                /// SearchWorks.Edge.Node.Casts.Edge.Node
                ///
                /// Parent Type: `Cast`
                public struct Node: Annict.SelectionSet {
                  public let __data: DataDict
                  public init(data: DataDict) { __data = data }

                  public static var __parentType: ApolloAPI.ParentType { Annict.Objects.Cast }
                  public static var __selections: [ApolloAPI.Selection] { [
                    .field("annictId", Int.self),
                    .field("name", String.self),
                    .field("nameEn", String.self),
                    .field("character", Character.self),
                  ] }

                  public var annictId: Int { __data["annictId"] }
                  public var name: String { __data["name"] }
                  public var nameEn: String { __data["nameEn"] }
                  public var character: Character { __data["character"] }

                  /// SearchWorks.Edge.Node.Casts.Edge.Node.Character
                  ///
                  /// Parent Type: `Character`
                  public struct Character: Annict.SelectionSet {
                    public let __data: DataDict
                    public init(data: DataDict) { __data = data }

                    public static var __parentType: ApolloAPI.ParentType { Annict.Objects.Character }
                    public static var __selections: [ApolloAPI.Selection] { [
                      .field("name", String.self),
                      .field("nameEn", String.self),
                    ] }

                    public var name: String { __data["name"] }
                    public var nameEn: String { __data["nameEn"] }
                  }
                }
              }
            }

            /// SearchWorks.Edge.Node.Staffs
            ///
            /// Parent Type: `StaffConnection`
            public struct Staffs: Annict.SelectionSet {
              public let __data: DataDict
              public init(data: DataDict) { __data = data }

              public static var __parentType: ApolloAPI.ParentType { Annict.Objects.StaffConnection }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("edges", [Edge?]?.self),
              ] }

              /// A list of edges.
              public var edges: [Edge?]? { __data["edges"] }

              /// SearchWorks.Edge.Node.Staffs.Edge
              ///
              /// Parent Type: `StaffEdge`
              public struct Edge: Annict.SelectionSet {
                public let __data: DataDict
                public init(data: DataDict) { __data = data }

                public static var __parentType: ApolloAPI.ParentType { Annict.Objects.StaffEdge }
                public static var __selections: [ApolloAPI.Selection] { [
                  .field("node", Node?.self),
                ] }

                /// The item at the end of the edge.
                public var node: Node? { __data["node"] }

                /// SearchWorks.Edge.Node.Staffs.Edge.Node
                ///
                /// Parent Type: `Staff`
                public struct Node: Annict.SelectionSet {
                  public let __data: DataDict
                  public init(data: DataDict) { __data = data }

                  public static var __parentType: ApolloAPI.ParentType { Annict.Objects.Staff }
                  public static var __selections: [ApolloAPI.Selection] { [
                    .field("name", String.self),
                    .field("roleText", String.self),
                    .field("roleOther", String.self),
                  ] }

                  public var name: String { __data["name"] }
                  public var roleText: String { __data["roleText"] }
                  public var roleOther: String { __data["roleOther"] }
                }
              }
            }
          }
        }
      }
    }
  }

}