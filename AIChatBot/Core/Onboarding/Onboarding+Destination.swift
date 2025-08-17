//
//  Onboarding+Destination.swift
//  AIChatBot
//
//  Created by Nando on 8/16/25.
//

import SwiftUI

enum OnboardingDestination {
    case intro
    case profileColor
    case completed
}

extension View {
    func onboardingDestinations(with navManager: NavigationManager, manager: OnboardingManager) -> some View {
        self
            .navigationDestination(for: OnboardingDestination.self) { value in
                ZStack {
                    switch value {
                    case .intro: OnboardingIntroScreen(navManager: navManager)
                    case .profileColor: OnboardingProfileColorScreen(navManager: navManager, manager: manager)
                    case .completed: OnboardingCompletedScreen(manager: manager)
                    }
                }
                .navigationBarBackButtonHidden(true)
            }
    }
}

/// Two ways to onboard new users
/// 1. Disable the back button on the navigation. This allows user to create a new account faster.
/// 2. Enable the back button on the naviation. This will allow users to change information such as their email, password, username and so on.
