//
//  SettingsScreen.swift
//  AIChatBot
//
//  Created by Nando on 8/16/25.
//

import SwiftUI

struct SettingsScreen: View {
    @Environment(AppState.self) private var appState
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                accountSettingsSection
                applicationSettingsSection
                loginSettingsSection
            }
        }
        .navigationTitle("Settings")
    }
}

// MARK: - Views
/// Views
extension SettingsScreen {
    private var accountSettingsSection: some View {
        ListViewBuilder(
            items: AccountSetting.allCases,
            dividerLeadingPadding: 16,
            content: { setting in
                Text(setting.title)
                    .foregroundStyle(setting.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
            }
        )
        .listFormSectionStyle(title: "Account", titleButton: { EmptyView() })
        .padding(.horizontal)
    }
    
    private var applicationSettingsSection: some View {
        ListViewBuilder(
            items: ApplicationSetting.allCases,
            dividerLeadingPadding: 16,
            content: { setting in
                Text(setting.title)
                    .foregroundStyle(setting.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
            }
        )
        .listFormSectionStyle(title: "Application", titleButton: { EmptyView() })
        .padding(.horizontal)
    }
    
    private var loginSettingsSection: some View {
        ListViewBuilder(
            items: LoginSetting.allCases,
            dividerLeadingPadding: 16,
            content: { setting in
                Text(setting.title)
                    .foregroundStyle(setting.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        )
        .listFormSectionStyle(title: "Login", titleButton: { EmptyView() })
        .padding(.horizontal)
    }
}

// MARK: - Actions
/// Actions
extension SettingsScreen {
    private func onSignOutPress() {
        appState.isShowingTabBar = false
    }
}

#Preview {
    NavigationStack {
        SettingsScreen()
            .environment(AppState())
    }
}
