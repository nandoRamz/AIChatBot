//
//  CarouselViewBuilder.swift
//  AIChatBot
//
//  Created by Nando on 8/17/25.
//

import SwiftUI

struct CarouselViewBuilder<Content: View, T: Hashable>: View {
    var items: [T]
    var displayCount: Int = 1
    var content: (T) -> Content
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 8) {
                ForEach(items, id: \.self) { item in
                    content(item)
                    .containerRelativeFrame(.horizontal, count: displayCount, spacing: 8)
                }
            }
        }
        .frame(height: 200)
        .scrollIndicators(.hidden)
        .scrollTargetLayout()
        .scrollTargetBehavior(.viewAligned)
    }
}

#Preview {
    CarouselViewBuilder(
        items: DBAvatarModel.mocks,
        content: { item in
            FeatureAvatarCell(
                title: item.name,
                description: item.characterDescription,
                imageUrl: item.imageUrl
            )
        }
    )
    .contentMargins(.horizontal, 16)
}
