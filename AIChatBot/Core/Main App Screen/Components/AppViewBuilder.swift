//
//  AppViewBuilder.swift
//  AIChatBot
//
//  Created by Nando on 8/15/25.
//

import SwiftUI

struct AppViewBuilder<TabBarView: View, OnboardingView: View>: View {
    var isShowingTabBarView: Bool
    @ViewBuilder var tabBarView: TabBarView
    @ViewBuilder var onboardingView: OnboardingView
    
    var body: some View {
        ZStack {
            if isShowingTabBarView {
                tabBarView
                    .transition(.move(edge: .trailing))
            } else {
                onboardingView
                    .transition(.move(edge: .leading))
            }
        }
        .animation(.smooth, value: isShowingTabBarView)
    }
}

// MARK: - Preview
/// Preview
#Preview("Tab Bar") {
    AppViewBuilder(
        isShowingTabBarView: true,
        tabBarView: {
            ZStack {
                Color.red
                    .ignoresSafeArea()
                
                Text("Tab Bar View")
            }
        },
        onboardingView: {
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                
                Text("Onboarding View")
            }
        }
    )
}

#Preview("Onboarding") {
    AppViewBuilder(
        isShowingTabBarView: false,
        tabBarView: {
            ZStack {
                Color.red
                    .ignoresSafeArea()
                
                Text("Tab Bar View")
            }
        },
        onboardingView: {
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                
                Text("Onboarding View")
            }
        }
    )
}
