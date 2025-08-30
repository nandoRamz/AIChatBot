//
//  ExploreScreen.swift
//  AIChatBot
//
//  Created by Nando on 8/15/25.
//

import SwiftUI

struct ExploreScreen: View {
    @State private var navManager = NavigationManager()
    
    let featuredAvatars = DBAvatarModel.mocks
    let categories = AvatarType.allCases
    let popularAvatars = DBAvatarModel.mocks

    var body: some View {
        NavigationStack(path: $navManager.path) {
            ScrollView {
                VStack(spacing: 32) {
                    featureAvatarsSection
                    avatarCategoriesSection
                    popularAvatarsSection
                }
            }
            .navigationTitle("Explore")
            .avatarChatDestination()
            .toolbar(.visible, for: .tabBar)
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
                .onTapGesture {
                    navManager.path.append(avatar)
                }
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
        .frame(height: 125)
        .listFormSectionStyle(title: "Categories")
        .contentMargins(.horizontal, 16)
    }
    
    private var popularAvatarsSection: some View {
        ListViewBuilder(
            items: popularAvatars,
            content: { avatar in
                PopularAvatarCell(avatar: avatar)
                    
            }
        )
        .listFormSectionStyle(title: "Popular", titlePadding: 16)
        .padding(.horizontal, 16)
    }
}

#Preview {
    ExploreScreen()
}
