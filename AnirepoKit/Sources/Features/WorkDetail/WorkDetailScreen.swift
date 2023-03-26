//
//  SwiftUIView.swift
//  
//
//  Created by Takahashi Tsubasa on 2023/03/26.
//

import SwiftUI
import WorkDetailData

public struct WorkDetailScreen: View {
    
    @StateObject private var viewModel: WorkDetailViewModel<ApolloWorkDetailRepository>
    
    public init(annictId: Int) {
        self._viewModel = StateObject(wrappedValue: WorkDetailViewModel(annictId: annictId))
    }
    
    public var body: some View {
        Text(viewModel.workDetail?.title ?? "")
    }
}

struct WorkDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        WorkDetailScreen(annictId: 1)
    }
}
