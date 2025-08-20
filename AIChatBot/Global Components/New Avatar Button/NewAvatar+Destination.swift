//
//  NewAvatar+Destination.swift
//  AIChatBot
//
//  Created by Nando on 8/20/25.
//

import SwiftUI

enum NewAvatarDestination: Hashable {
    case root
}

// MARK: - View
/// View
extension View {
    func newAvatarDestinations() -> some View {
        self
            .navigationDestination(for: NewAvatarDestination.self) { value in
                switch value {
                case .root: CreateNewAvatarScreen()
                }
            }
    }
}
