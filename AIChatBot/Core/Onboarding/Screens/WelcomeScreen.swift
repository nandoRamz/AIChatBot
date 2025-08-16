//
//  WelcomeScreen.swift
//  AIChatBot
//
//  Created by Nando on 8/15/25.
//

import SwiftUI

struct WelcomeScreen: View {
    @State private var navManager = NavigationManager()
    
    var body: some View {
        NavigationStack(path: $navManager.path) {
            VStack {
                Text("Welcome!!!")
                    .frame(maxHeight: .infinity)
                
                PrimaryButton(title: "Get Started", action: { onGetStartedPress() })
            }
            .padding(.horizontal)
            .onboardingDestinations()
        }
    }
}

// MARK: - Actions
/// Actions
extension WelcomeScreen {
    private func onGetStartedPress() {
        navManager.path.append(OnboardingDestination.completed)
    }
}

#Preview {
    WelcomeScreen()
}
