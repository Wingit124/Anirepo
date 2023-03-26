//
//  File.swift
//  
//
//  Created by Takahashi Tsubasa on 2023/03/20.
//

import SwiftUI
import SearchData

@MainActor
final class SearchViewModel<Repository: SearchRepository>: ObservableObject {
    
    private let repository: Repository
    
    @Published var searchTerm: String = ""
    @Published var works: [Work] = []
    
    init(repository: Repository = ApolloSearchRepository()) {
        self.repository = repository
    }
    
}

extension SearchViewModel {
    
    func onSubmit() {
        Task {
            works = await repository.search(title: searchTerm)
        }
    }
    
}
