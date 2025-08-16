//
//  SettingsButton.swift
//  AIChatBot
//
//  Created by Nando on 8/15/25.
//

import SwiftUI

struct SettingsButton: View {
    @State private var isShowingSettingsScreen: Bool = false
    
    var navManager: NavigationManager
    
    var body: some View {
        Button {
            onPress()
        } label: {
            label
        }
    }
}

// MARK: - Views
/// Views
extension SettingsButton {
    private var label: some View {
        Image(systemName: SystemImage.settings.name)
            .font(.headline)
    }
}

// MARK: - Actions
/// Actions
extension SettingsButton {
    private func onPress() {
        navManager.path.append(SettingsDestination.root)
    }
}

#Preview {
    SettingsButton(navManager: NavigationManager())
}
