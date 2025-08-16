//
//  AppView.swift
//  AIChatBot
//
//  Created by Nando on 8/15/25.
//

import SwiftUI

struct MainAppScreen: View {
    @State var appState = AppState()
    
    var body: some View {
        AppViewBuilder(
            isShowingTabBarView: appState.isShowingTabBar,
            tabBarView: { TabBarScreen() },
            onboardingView: { WelcomeScreen() }
        )
        .environment(appState)
    }
}

#Preview("Tab Bar") {
    MainAppScreen(appState: .init(isShowingTabBar: true))
}

#Preview("Welcome") {
    MainAppScreen(appState: .init(isShowingTabBar: false))
}
