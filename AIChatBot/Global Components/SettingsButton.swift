//
//  SettingsButton.swift
//  AIChatBot
//
//  Created by Nando on 8/15/25.
//

import SwiftUI

struct SettingsButton: View {
    @State private var isShowingSettingsScreen: Bool = false
    
    var body: some View {
        Button {
            onPress()
        } label: {
            label
        }
        .sheet(isPresented: $isShowingSettingsScreen) {
            Text("Settings View")
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
        isShowingSettingsScreen.toggle()
    }
}

#Preview {
    SettingsButton()
}
