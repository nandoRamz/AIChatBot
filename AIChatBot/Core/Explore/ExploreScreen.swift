//
//  ExploreScreen.swift
//  AIChatBot
//
//  Created by Nando on 8/15/25.
//

import SwiftUI

struct ExploreScreen: View {
    let avatar = DBAvatarModel.mock
    let items = DBAvatarModel.mocks
    
    var body: some View {
        NavigationStack {
            ScrollView {
                featureAvatarsSection
            }
            .navigationTitle("Explore")
        }
    }
}

// MARK: - Views
/// Views
extension ExploreScreen {
    private var featureAvatarsSection: some View {
        CarouselViewBuilder(
            items: items,
            content: { avatar in
                FeatureAvatarCell(
                    title: avatar.name,
                    description: avatar.characterDescription,
                    imageUrl: avatar.imageUrl
                )
            }
        )
        .contentMargins(.horizontal, 16)
    }
}

#Preview {
    ExploreScreen()
}
