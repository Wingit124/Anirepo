//
//  SwiftUIView.swift
//  
//
//  Created by Takahashi Tsubasa on 2023/03/20.
//

import SwiftUI
import Routing
import SearchData

struct SearchView: View {
    
    let works: [Work]
    let rowSelected: (Int) -> Void
    
    var body: some View {
        List(works) { work in
            WorkRowView(work: work)
                .onTapGesture {
                    rowSelected(work.annictId)
                }
                .frame(height: 70)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(
            works: [.preview],
            rowSelected: { _ in }
        )
    }
}
