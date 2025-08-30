//
//  SystemImage.swift
//  AIChatBot
//
//  Created by Nando on 8/15/25.
//

import Foundation

enum SystemImage {
    case explore
    case chats
    case profile
    case settings
    case add
    case send
    case mute
    case unmute
    case share
    case report
    case more
    
    var name: String {
        switch self {
        case .more: "ellipsis"
        case .report: "exclamationmark.circle"
        case .share: "paperplane"
        case .unmute: "bell.slash"
        case .mute: "bell"
        case .send: "paperplane"
        case .add: "plus"
        case .explore: "magnifyingglass"
        case .chats: "bubble.left.and.bubble.right.fill"
        case .profile: "person.fill"
        case .settings: "gear"
        }
    }
}
