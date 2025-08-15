//
//  AppView.swift
//  AIChatBot
//
//  Created by Nando on 8/15/25.
//

import SwiftUI

struct MainAppScreen: View {
    @State private var isShowingTabBarView: Bool = false
    var body: some View {
        AppViewBuilder(
            isShowingTabBarView: isShowingTabBarView,
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
}

#Preview {
    MainAppScreen()
}
