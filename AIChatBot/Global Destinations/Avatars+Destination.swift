//
//  Avatars+Destination.swift
//  AIChatBot
//
//  Created by Nando on 8/31/25.
//

import SwiftUI

extension View {
    func avatarsDestination(navManager: NavigationManager) -> some View {
        self
            .navigationDestination(for: AvatarType.self) { _ in
                AvatarsScreen(navManager: navManager)
            }
    }
}
