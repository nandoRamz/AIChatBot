//
//  AvatarChatScreen.swift
//  AIChatBot
//
//  Created by Nando on 8/21/25.
//

import SwiftUI

struct AvatarChatScreen: View {
    @State private var chatMessages: [DBMessageModel] = DBMessageModel.mocks
    @State private var avatar: DBAvatarModel = .mock
    @State private var newMessageText: String = ""

    @State private var alert: UIAlert?
    
    var body: some View {
        ScrollViewReader { _ in
            ScrollView {
                LazyVStack(spacing: 24) {
                    ForEach(chatMessages, id: \.self) { message in
                        MessageCell(
                            message: message,
                            isCurrentUser: avatar.id == message.creatorId,
                            imageUrl: avatar.imageUrl
                        )
                    }
                }
                .padding(.horizontal)
                .padding(.top, 24)
            }
            .safeAreaInset(
                edge: .bottom,
                content: {
                    NewMessageCell(placeholder: "Message Alpha", text: $newMessageText, onSendPress: {})
                }
            )
            .clipped()
            .navigationTitle("Alpha")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.hidden, for: .tabBar)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    CustomMenu(
                        groups: [
                            [ChatMenuSelectable.mute, ChatMenuSelectable.share],
                            [ChatMenuSelectable.report]
                        ],
                        onItemPress: { item in
                            onItemPress(item)
                        },
                        label: {
                            Image(systemName: SystemImage.more.name)
                        }
                    )
                }
            }
            .customDialog(
                $alert,
                onActionPress: { action in
                    if let reportAction = action as? ReportAction {
                        onReportActionPress(reportAction)
                    }
                }
            )
        }
    }
}

// MARK: - Actions
/// Actions
extension AvatarChatScreen {
    private func onItemPress(_ item: ChatMenuSelectable) {
        switch item {
        case .mute:
            print("Mute")
        case .share:
            print("Share")
        case .report:
            alert = .init(
                message: "What is the reason for reporting?",
                actions: ReportAction.allCases
            )
        }
    }
    
    private func onReportActionPress(_ action: ReportAction) {
        switch action {
        case .reason1: print("reason 1 pressed")
        case .reason2: print("reason 2 pressed")
        case .reason3: print("reason 3 pressed")
        }
    }
}

// MARK: - Enums
/// Enums
extension AvatarChatScreen {
    private enum ChatMenuSelectable: String, MenuSelectable {
        case mute
        case share
        case report
        
        var title: String { self.rawValue.capitalized }
        
        var systemImage: String? {
            switch self {
            case .mute: SystemImage.mute.name
            case .share: SystemImage.share.name
            case .report: SystemImage.report.name
            }
        }
        
        var role: ButtonRole? {
            switch self {
            case .report: return .destructive
            default: return nil
            }
        }
    }
    
    private enum ReportAction: String, MenuSelectable, CaseIterable {
        case reason1 = "reason 1"
        case reason2 = "reason 2"
        case reason3 = "reason 3"
        
        var title: String { return self.rawValue.capitalized }
    }
}

#Preview {
    NavigationStack {
        AvatarChatScreen()
    }
}
