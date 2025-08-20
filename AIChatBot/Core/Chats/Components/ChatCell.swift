//
//  ChatCell.swift
//  AIChatBot
//
//  Created by Nando on 8/19/25.
//

import SwiftUI

struct ChatCell: View {
    @State private var avatar: DBAvatarModel?
    @State private var lastMessage: DBMessageModel?
    @State private var didLoadAvatar: Bool = false
    @State private var didLoadLastMessage: Bool = false
    
    var chat: DBChatModel
    var getAvatar: () async -> DBAvatarModel
    var getLastMessage: () async -> DBMessageModel
    
    var body: some View {
        HStack(spacing: 8) {
            image
            message
            newBadgeIcon
        }
        .task {
            if didLoadAvatar { return }
            avatar = await getAvatar()
            didLoadAvatar = true
        }
        .task { 
            if didLoadLastMessage { return }
            lastMessage = await getLastMessage()
            didLoadLastMessage = true
        }
    }
}

// MARK: - Views
/// Views
extension ChatCell {
    private var image: some View {
        ImageLoaderViewBuilder(urlString: avatar?.imageUrl)
            .frame(width: 50, height: 50)
            .clipShape(.circle)
    }
    
    private var message: some View {
        VStack(alignment: .leading) {
            Text(avatar?.name ?? "Unavailable")
                .font(.headline)
            Text(lastMessage?.text ?? "")
                .foregroundStyle(.secondary)
                .lineLimit(1)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var newBadgeIcon: some View {
        Text("New")
            .font(.footnote)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(.accent)
            .clipShape(.rect(cornerRadius: 4))
    }
}

#Preview {
    ChatCell(
        chat: .mock,
        getAvatar: { .mock },
        getLastMessage: { .mock }
    )
    .padding(.horizontal)
}
