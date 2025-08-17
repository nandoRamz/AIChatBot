//
//  WelcomeScreen.swift
//  AIChatBot
//
//  Created by Nando on 8/15/25.
//

import SwiftUI

struct WelcomeScreen: View {
    @State private var navManager = NavigationManager()
    @State private var imageUrl = Constants.randomImageUrl
    
    var body: some View {
        NavigationStack(path: $navManager.path) {
            VStack(spacing: 32) {
                image
                titleText
                getStartedButton
                
                Spacer()
                
                VStack(spacing: 16) {
                    alreadyHaveAnAccountButton
                    termsAndPolicyButton
                }
                .frame(maxHeight: .infinity)
                .padding(.horizontal)
                .padding(.bottom)
            }
            .onboardingDestinations(with: navManager)
        }
    }
}

// MARK: - Views
/// Views
extension WelcomeScreen {
    private var image: some View {
        ImageLoaderViewBuilder(urlString: imageUrl)
            .ignoresSafeArea()
            .aspectRatio(3/4, contentMode: .fill)
            .frame(maxWidth: .infinity)
    }
    
    private var titleText: some View {
        Text("AI Chat Bot")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.horizontal)
    }
    
    private var getStartedButton: some View {
        PrimaryButton(
            title: "Get Started",
            action: { onGetStartedPress() }
        )
        .padding(.horizontal)
    }
    
    private var alreadyHaveAnAccountButton: some View {
        Text("Already have an account? Sign in here.")
            .underline()
    }
    
    // Open safari later
    private var termsAndPolicyButton: some View {
        Text("Terms of service • Privacy policy")
            .foregroundStyle(.accent)
            .padding(.bottom)
    }
}

// MARK: - Actions
/// Actions
extension WelcomeScreen {
    private func onGetStartedPress() {
        navManager.path.append(OnboardingDestination.intro)
    }
}

#Preview {
    WelcomeScreen()
}
