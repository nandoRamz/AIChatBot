//
//  ListViewBuilder.swift
//  AIChatBot
//
//  Created by Nando on 8/18/25.
//

import SwiftUI

struct ListViewBuilder<Content: View, T: Hashable>: View {
    var items: [T]
    var content: (T) -> Content
    
    var body: some View {
        LazyVStack(spacing: 0) {
            ForEach(items, id: \.self) { item in
                content(item)
                    .padding(.vertical)
                    .padding(.horizontal)
                    .background(dividerBackground(for: item))
            }
        }
        .background(.ultraThinMaterial)
        .clipShape(.rect(cornerRadius: 15))
    }
    
    @ViewBuilder
    func dividerBackground(for item: T) -> some View {
        if items.count > 1 {
            Divider()
                .frame(maxHeight: .infinity, alignment: .bottom)
                .opacity(item == items.last ? 0 : 1)
                .padding(.leading, 75 + 16 + 8)
        }
    }
}

#Preview {
    ListViewBuilder(
        items: DBAvatarModel.mocks,
        content: { avatar in
            PopularAvatarCell(avatar: avatar)
        }
    )
    .padding(.horizontal)
}
