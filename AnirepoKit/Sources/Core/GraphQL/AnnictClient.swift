//
//  File.swift
//  
//
//  Created by Takahashi Tsubasa on 2023/02/16.
//

import Foundation
import Apollo

public class AnnictClient {
    
    public static let shared: AnnictClient = .init()
    private init() {}
    
    public let apollo: ApolloClient = {
        let endpointURL = URL(string: "https://api.annict.com/graphql")!
        let store = ApolloStore()
        let interceptorProvider = NetworkInterceptorsProvider(interceptors: [TokenInterceptor(token: AccessTokens.ANNICT_ACCESS_TOKEN)], store: store)
        let networkTransport = RequestChainNetworkTransport(interceptorProvider: interceptorProvider, endpointURL: endpointURL, autoPersistQueries: false)
        return ApolloClient(networkTransport: networkTransport, store: store)
    }()
    
}
        
class TokenInterceptor: ApolloInterceptor {
    
    let token: String
    
    init(token: String) {
        self.token = token
    }
    
    func interceptAsync<Operation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) where Operation : GraphQLOperation {
            request.addHeader(name: "Authorization", value: "Bearer \(token)")
            chain.proceedAsync(request: request, response: response, completion: completion)
    }
    
}

class NetworkInterceptorsProvider: DefaultInterceptorProvider {
    
    let interceptors: [ApolloInterceptor]
    
    init(interceptors: [ApolloInterceptor], store: ApolloStore) {
        self.interceptors = interceptors
        super.init(store: store)
    }
    
    override func interceptors<Operation>(for operation: Operation) -> [ApolloInterceptor] where Operation : GraphQLOperation {
        var interceptors = super.interceptors(for: operation)
        self.interceptors.forEach { interceptor in
            interceptors.insert(interceptor, at: 0)
        }
        return interceptors
    }
}
