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
                avatarCategories
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
    
    private var avatarCategories: some View { 
        CarouselViewBuilder(
            items: AvatarType.allCases,
            displayCount: 2,
            content: { category in
                AvatarCategoryCell(
                    title: category.rawValue.capitalized,
                    imageUrl: Constants.randomImageUrl
                )
            }
        )
        .contentMargins(.horizontal, 16)
    }
}

#Preview {
    ExploreScreen()
}
