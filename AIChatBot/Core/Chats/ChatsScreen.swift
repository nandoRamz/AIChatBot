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
                        ChatCell()
                    }
                )
                .padding(.horizontal)
            }
            .navigationTitle("Chats")
        }
    }
}

#Preview {
    ChatsScreen()
}
