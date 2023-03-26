//
//  File.swift
//  
//
//  Created by Takahashi Tsubasa on 2023/03/26.
//

import SwiftUI
import WorkDetailData

@MainActor
final class WorkDetailViewModel<Repository: WorkDetailRepository>: ObservableObject {
    
    private let repository: Repository
    
    @Published var workDetail: WorkDetail?
    
    init(repository: Repository = ApolloWorkDetailRepository(), annictId: Int) {
        self.repository = repository
        Task {
            self.workDetail = await repository.fetch(annictId: annictId)
        }
    }
    
}

extension WorkDetailViewModel {
    
}
