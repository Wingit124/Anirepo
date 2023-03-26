//
//  SwiftUIView.swift
//  
//
//  Created by Takahashi Tsubasa on 2023/03/20.
//

import SwiftUI
import SearchData

struct WorkRowView: View {
    
    let work: Work
    
    var body: some View {
        HStack {
            AsyncImage(url: work.thumbnailUrl) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100)
            } placeholder: {
                Text("No image")
            }
            .frame(width: 100)
            VStack {
                Text(work.title)
                Text(work.annictId.description)
            }
        }
    }
}

struct WorkRowView_Previews: PreviewProvider {
    static var previews: some View {
        WorkRowView(work: .preview)
    }
}
