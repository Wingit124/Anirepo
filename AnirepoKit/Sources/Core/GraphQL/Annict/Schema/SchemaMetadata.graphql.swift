// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public protocol Annict_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == Annict.SchemaMetadata {}

public protocol Annict_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == Annict.SchemaMetadata {}

public protocol Annict_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == Annict.SchemaMetadata {}

public protocol Annict_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == Annict.SchemaMetadata {}

public extension Annict {
  typealias ID = String

  typealias SelectionSet = Annict_SelectionSet

  typealias InlineFragment = Annict_InlineFragment

  typealias MutableSelectionSet = Annict_MutableSelectionSet

  typealias MutableInlineFragment = Annict_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    public static func objectType(forTypename typename: String) -> Object? {
      switch typename {
      case "Query": return Annict.Objects.Query
      case "WorkConnection": return Annict.Objects.WorkConnection
      case "Work": return Annict.Objects.Work
      case "Activity": return Annict.Objects.Activity
      case "Cast": return Annict.Objects.Cast
      case "Channel": return Annict.Objects.Channel
      case "ChannelGroup": return Annict.Objects.ChannelGroup
      case "Character": return Annict.Objects.Character
      case "Episode": return Annict.Objects.Episode
      case "LibraryEntry": return Annict.Objects.LibraryEntry
      case "MultipleRecord": return Annict.Objects.MultipleRecord
      case "Organization": return Annict.Objects.Organization
      case "Person": return Annict.Objects.Person
      case "Prefecture": return Annict.Objects.Prefecture
      case "Program": return Annict.Objects.Program
      case "Record": return Annict.Objects.Record
      case "Review": return Annict.Objects.Review
      case "Series": return Annict.Objects.Series
      case "Staff": return Annict.Objects.Staff
      case "Status": return Annict.Objects.Status
      case "User": return Annict.Objects.User
      case "WorkImage": return Annict.Objects.WorkImage
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}