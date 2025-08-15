//
//  AppView.swift
//  AIChatBot
//
//  Created by Nando on 8/15/25.
//

import SwiftUI

struct MainAppScreen: View {
    @State private var isShowingTabBarView: Bool = false
    
    init(isShowingTabBarView: Bool = false) {
        _isShowingTabBarView = State(wrappedValue: isShowingTabBarView)
    }
    
    var body: some View {
        AppViewBuilder(
            isShowingTabBarView: isShowingTabBarView,
            tabBarView: { TabBarScreen() },
            onboardingView: { WelcomeScreen() }
        )
    }
}

#Preview("Tab Bar") {
    MainAppScreen(isShowingTabBarView: true)
}

#Preview("Welcome") {
    MainAppScreen(isShowingTabBarView: false)
}
