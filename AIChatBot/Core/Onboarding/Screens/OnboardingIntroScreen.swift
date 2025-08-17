//
//  OnboardingIntroScreen.swift
//  AIChatBot
//
//  Created by Nando on 8/16/25.
//

import SwiftUI

struct OnboardingIntroScreen: View {
    var navManager: NavigationManager
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 32) {
                avatarText
                realConversations
            }
            .font(.title3)
            .baselineOffset(6)
            .frame(maxHeight: .infinity)
            
            continueButton
        }
        .padding(.horizontal)
    }
}

// MARK: - Views
/// Views
extension OnboardingIntroScreen {
    private var avatarText: some View {
        Text("Make your own ")
        +
        Text("avatars")
            .fontWeight(.semibold)
            .foregroundStyle(.accent)
        +
        Text(" and chat with them!")
    }
    
    private var realConversations: some View {
        Text("Have ")
        +
        Text("real conversations")
            .fontWeight(.semibold)
            .foregroundStyle(.accent)
        +
        Text(" with AI generated responses.")
    }
    
    private var continueButton: some View {
        PrimaryButton(
            title: "Continue",
            action: { onContinuePress() }
        )
        .padding(.bottom)
    }
}

// MARK: - Actions
/// Actions
extension OnboardingIntroScreen {
    private func onContinuePress() {
        navManager.path.append(OnboardingDestination.profileColor)
    }
}

#Preview {
    OnboardingIntroScreen(navManager: NavigationManager())
}
