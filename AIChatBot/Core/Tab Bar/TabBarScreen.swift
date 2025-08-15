//
//  TabBarScreen.swift
//  AIChatBot
//
//  Created by Nando on 8/15/25.
//

import SwiftUI

struct TabBarScreen: View {
    var body: some View {
        TabView {
            ExploreScreen()
                .tabItem {
                    Label("Explore", systemImage: SystemImage.explore.name)
                }
            
            ChatsScreen()
                .tabItem {
                    Label("Chats", systemImage: SystemImage.chats.name)
                }
            
            ProfileScreen()
                .tabItem {
                    Label("Profile", systemImage: SystemImage.profile.name)
                }
        }
    }
}

#Preview {
    TabBarScreen()
}
