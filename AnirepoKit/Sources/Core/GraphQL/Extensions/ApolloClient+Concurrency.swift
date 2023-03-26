//
//  File.swift
//  
//
//  Created by Takahashi Tsubasa on 2023/03/20.
//

import Apollo

extension ApolloClient {
    
    public func fetch<Query: GraphQLQuery>(query: Query) async throws -> GraphQLResult<Query.Data> {
        return try await withCheckedThrowingContinuation { continuation in
            fetch(query: query) { result in
                switch result {
                case .success(let value):
                    continuation.resume(returning: value)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    public func perform<Mutation: GraphQLMutation>(mutation: Mutation) async throws -> GraphQLResult<Mutation.Data> {
        return try await withCheckedThrowingContinuation { continuation in
            perform(mutation: mutation) { result in
                switch result {
                case .success(let value):
                    continuation.resume(returning: value)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
}
