//
//  AvatarChat+Destination.swift
//  AIChatBot
//
//  Created by Nando on 8/30/25.
//

import SwiftUI

extension View {
    func avatarChatDestination() -> some View {
        self
            .navigationDestination(for: DBAvatarModel.self) { _ in
                AvatarChatScreen()
            }
    }
}
