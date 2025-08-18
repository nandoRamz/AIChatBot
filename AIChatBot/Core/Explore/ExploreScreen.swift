//
//  ExploreScreen.swift
//  AIChatBot
//
//  Created by Nando on 8/15/25.
//

import SwiftUI

struct ExploreScreen: View {
    let featuredAvatars = DBAvatarModel.mocks
    let categories = AvatarType.allCases
    let popularAvatars = DBAvatarModel.mocks

    var body: some View {
        NavigationStack {
            ScrollView {
                featureAvatarsSection
                avatarCategoriesSection
                popularAvatarsSection
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
            items: featuredAvatars,
            content: { avatar in
                FeatureAvatarCell(
                    title: avatar.name,
                    description: avatar.characterDescription,
                    imageUrl: avatar.imageUrl
                )
            }
        )
        .frame(height: 200)
        .contentMargins(.horizontal, 16)
    }
    
    private var avatarCategoriesSection: some View {
        CarouselViewBuilder(
            items: categories,
            displayCount: 3,
            content: { category in
                AvatarCategoryCell(
                    title: category.rawValue.capitalized,
                    imageUrl: Constants.randomImageUrl
                )
            }
        )
        .frame(height: 150)
        .contentMargins(.horizontal, 16)
    }
    
    private var popularAvatarsSection: some View {
        ListViewBuilder(
            items: popularAvatars,
            content: { avatar in
                PopularAvatarCell(avatar: avatar)
            }
        )
        .padding(.horizontal, 16)
    }
}

#Preview {
    ExploreScreen()
}
