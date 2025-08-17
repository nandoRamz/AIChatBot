//
//  OnboardingCompletedScreen.swift
//  AIChatBot
//
//  Created by Nando on 8/16/25.
//

import SwiftUI

struct OnboardingCompletedScreen: View {
    @Environment(AppState.self) private var appState
    
    var manager: OnboardingManager
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 16) {
                titleText
                descriptionText
            }
            .frame(maxHeight: .infinity)
            
            finishButton
        }
        .padding(.horizontal)
    }
}

// MARK: - Views
/// Views
extension OnboardingCompletedScreen {
    private var titleText: some View {
        Text("Setup Complete!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(manager.profileColor ?? .accent)
    }
    
    private var descriptionText: some View {
        Text("We just need you to confirm and you're ready to start chattting.")
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundStyle(.secondary)
    }
    
    private var finishButton: some View {
        PrimaryButton(
            title: "Finish",
            backgroundColor: manager.profileColor,
            action: { onFinishPress() }
        )
        .padding(.vertical)
    }
}

// MARK: - Actions
/// Actions
extension OnboardingCompletedScreen {
    private func onFinishPress() {
        appState.isShowingTabBar = true
    }
}

#Preview {
    OnboardingCompletedScreen(manager: OnboardingManager())
        .environment(AppState())
}
