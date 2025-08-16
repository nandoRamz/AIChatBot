//
//  Onboarding+Destination.swift
//  AIChatBot
//
//  Created by Nando on 8/16/25.
//

import SwiftUI

enum OnboardingDestination {
    case completed
}

extension View {
    func onboardingDestinations() -> some View {
        self
            .navigationDestination(for: OnboardingDestination.self) { value in
                switch value {
                case .completed: OnboardingCompletedScreen()
                }
            }
    }
}
