// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension Annict {
  class SearchWorksQuery: GraphQLQuery {
    public static let operationName: String = "SearchWorks"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query SearchWorks($titles: [String!]!, $seasons: [String!]!) {
          searchWorks(
            titles: $titles
            seasons: $seasons
            orderBy: {field: WATCHERS_COUNT, direction: DESC}
          ) {
            __typename
            edges {
              __typename
              node {
                __typename
                annictId
                title
                image {
                  __typename
                  recommendedImageUrl
                }
              }
            }
          }
        }
        """#
      ))

    public var titles: [String]
    public var seasons: [String]

    public init(
      titles: [String],
      seasons: [String]
    ) {
      self.titles = titles
      self.seasons = seasons
    }

    public var __variables: Variables? { [
      "titles": titles,
      "seasons": seasons
    ] }

    public struct Data: Annict.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ApolloAPI.ParentType { Annict.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("searchWorks", SearchWorks?.self, arguments: [
          "titles": .variable("titles"),
          "seasons": .variable("seasons"),
          "orderBy": [
            "field": "WATCHERS_COUNT",
            "direction": "DESC"
          ]
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
              .field("image", Image?.self),
            ] }

            public var annictId: Int { __data["annictId"] }
            public var title: String { __data["title"] }
            public var image: Image? { __data["image"] }

            /// SearchWorks.Edge.Node.Image
            ///
            /// Parent Type: `WorkImage`
            public struct Image: Annict.SelectionSet {
              public let __data: DataDict
              public init(data: DataDict) { __data = data }

              public static var __parentType: ApolloAPI.ParentType { Annict.Objects.WorkImage }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("recommendedImageUrl", String?.self),
              ] }

              public var recommendedImageUrl: String? { __data["recommendedImageUrl"] }
            }
          }
        }
      }
    }
  }

}