//
//  SwiftUIView.swift
//  
//
//  Created by Takahashi Tsubasa on 2023/02/17.
//

import SwiftUI
import Routing
import SearchData

public struct SearchScreen: View {
    
    @Environment(\.navigation) var navigation
    
    @StateObject private var viewModel: SearchViewModel<ApolloSearchRepository>
    
    public init() {
        self._viewModel = StateObject(wrappedValue: SearchViewModel())
    }
    
    public var body: some View {
        SearchView(
            works: viewModel.works,
            rowSelected: { annictId in
                rowSelected(annictId: annictId)
            }
        )
        .navigationTitle("Search")
        .searchable(
            text: $viewModel.searchTerm,
            placement: .navigationBarDrawer(displayMode: .always)
        )
        .onSubmit(of: .search) {
            viewModel.onSubmit()
        }
    }
}

extension SearchScreen {
    func rowSelected(annictId: Int) {
        navigation.push(to: .workDetail(annictId: annictId))
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}
