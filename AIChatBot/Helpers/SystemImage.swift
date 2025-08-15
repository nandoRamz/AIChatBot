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
    
    var name: String {
        switch self {
        case .explore: "magnifyingglass"
        case .chats: "bubble.left.and.bubble.right.fill"
        case .profile: "person.fill"
        case .settings: "gear"
        }
    }
}
