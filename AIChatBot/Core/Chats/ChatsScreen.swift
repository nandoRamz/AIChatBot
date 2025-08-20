//
//  ChatsScreen.swift
//  AIChatBot
//
//  Created by Nando on 8/15/25.
//

import SwiftUI

struct ChatsScreen: View {
    @State private var navManager = NavigationManager()
    @State private var chats: [DBChatModel] = DBChatModel.mocks
    
    var body: some View {
        NavigationStack(path: $navManager.path) {
            ScrollView {
                ListViewBuilder(
                    items: chats,
                    content: { chat in
                        ChatCell(
                            chat: chat,
                            getAvatar: { await fetchAvatar(for: chat) },
                            getLastMessage: { await fetchLastMessage(for: chat) }
                        )
                    }
                )
                .padding(.horizontal)
            }
            .navigationTitle("Chats")
        }
    }
}

// MARK: - Methods
/// Methods
extension ChatsScreen {
    private func fetchAvatar(for chat: DBChatModel) async -> DBAvatarModel {
        return .mock
    }
    
    private func fetchLastMessage(for chat: DBChatModel) async -> DBMessageModel {
        return .mock
    }
}

#Preview {
    ChatsScreen()
}
