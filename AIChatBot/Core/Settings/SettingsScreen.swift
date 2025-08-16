//
//  SettingsScreen.swift
//  AIChatBot
//
//  Created by Nando on 8/16/25.
//

import SwiftUI

struct SettingsScreen: View {
    @Environment(AppState.self) private var appState
    
    var body: some View {
        List {
            Button {
                onSignOutPress()
            } label: {
                Text("Sign Out")
            }
        }
        .navigationTitle("Settings")
    }
}

// MARK: - Actions
/// Actions
extension SettingsScreen {
    private func onSignOutPress() {
        appState.isShowingTabBar = false
    }
}

#Preview {
    SettingsScreen()
        .environment(AppState())
}
