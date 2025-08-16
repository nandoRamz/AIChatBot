//
//  Settings+Destination.swift
//  AIChatBot
//
//  Created by Nando on 8/16/25.
//

import SwiftUI

enum SettingsDestination {
    case root
}

// MARK: - View
/// View
extension View {
    func settingsDestinations() -> some View {
        self
            .navigationDestination(for: SettingsDestination.self) { value in
                switch value {
                case .root: SettingsScreen()
                }
            }
    }
}
