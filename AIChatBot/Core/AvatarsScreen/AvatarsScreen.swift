//
//  AvatarsScreen.swift
//  AIChatBot
//
//  Created by Nando on 8/30/25.
//

import SwiftUI

struct AvatarsScreen: View {
    var navManager: NavigationManager
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                image(height: 350)
                avatarCollection
            }
        }
        .ignoresSafeArea(.all)
        .scrollIndicators(.hidden)
    }
}

// MARK: - Views
/// Views
extension AvatarsScreen {
    private func image(height: CGFloat) -> some View {
        StretchyImageViewBuilder(
            imageUrlString: Constants.randomImageUrl,
            height: height
        )
        .overlay(alignment: .bottomLeading) {
            Text("Aliens")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.all)
                .padding(.top)
                .gradientBackgroundStyle(startPoint: .bottom, endPoint: .top)
        }
    }
    
    private var avatarCollection: some View {
        ListViewBuilder(
            items: DBAvatarModel.mocks,
            dividerLeadingPadding: 72,
            content: { avatar in
                AvatarCell(avatar: avatar)
                    .onTapGesture {
                        navManager.path.append(avatar)
                    }
            }
        )
        .padding(.horizontal)
    }
}

#Preview {
    NavigationStack {
        AvatarsScreen(navManager: NavigationManager())
            .navigationTitle("Hello")
            .navigationBarTitleDisplayMode(.inline)
    }
}
