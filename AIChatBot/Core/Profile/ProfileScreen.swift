//
//  ProfileScreen.swift
//  AIChatBot
//
//  Created by Nando on 8/15/25.
//

import SwiftUI

struct ProfileScreen: View {
    @State private var navManager = NavigationManager()
    @State private var avatars = DBAvatarModel.mocks
    @State private var user: DBUserModel = .mock
    
    var body: some View {
        NavigationStack(path: $navManager.path) {
            ScrollView {
                VStack(spacing: 32) {
                    userProfileImage
                    myAvatarsSection
                }
            }
            .navigationTitle("Profile")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    SettingsButton(navManager: navManager)
                }
            }
            .settingsDestinations()
            .newAvatarDestinations()
        }
    }
}

// MARK: - Views
/// Views
extension ProfileScreen {
    private var userProfileImage: some View {
        ZStack {
            ImageLoaderViewBuilder(urlString: Constants.randomImageUrl)
            Color.init(hex: user.profileHexColor)
        }
        .frame(width: 150, height: 150)
        .clipShape(.circle)
    }
    
    private var myAvatarsSection: some View {
        ListViewBuilder(
            items: avatars,
            dividerLeadingPadding: 50,
            content: { avatar in
                MyAvatarCell(avatar: avatar)
            }
        )
        .listFormSectionStyle(title: "My Avatars", titleButton: { addNewAvatarButton })
        .padding(.horizontal)
    }
    
    private var addNewAvatarButton: some View {
        Image(systemName: SystemImage.add.name)
            .foregroundStyle(.white)
            .frame(width: 29, height: 29)
            .background(Color.accent)
            .clipShape(.circle)
            .onTapGesture { onAddNewAvatarPress() }
    }
}

// MARK: - Methods
/// Methods
extension ProfileScreen {
    private func onAddNewAvatarPress() {
        navManager.path.append(NewAvatarDestination.root)
    }
}

#Preview {
    ProfileScreen()
        .environment(AppState())
}
