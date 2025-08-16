//
//  OnboardingCompletedScreen.swift
//  AIChatBot
//
//  Created by Nando on 8/16/25.
//

import SwiftUI

struct OnboardingCompletedScreen: View {
    @Environment(AppState.self) private var appState
    
    var body: some View {
        VStack {
            Text("Onboarding Completed!!")
                .frame(maxHeight: .infinity)
            
            PrimaryButton(title: "Finished", action: { onFinishedPress() })
        }
        .padding(.horizontal)
    }
}

// MARK: - Actions
/// Actions
extension OnboardingCompletedScreen {
    private func onFinishedPress() {
        appState.isShowingTabBar = true
    }
}

#Preview {
    OnboardingCompletedScreen()
        .environment(AppState())
}
