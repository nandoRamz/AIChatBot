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
    func onboardingDestinations(with navManager: NavigationManager) -> some View {
        self
            .navigationDestination(for: OnboardingDestination.self) { value in
                switch value {
                case .intro: OnboardingIntroScreen(navManager: navManager)
                case .profileColor: OnboardingProfileColorScreen(navManager: navManager)
                case .completed: OnboardingCompletedScreen()
                }
            }
    }
}
