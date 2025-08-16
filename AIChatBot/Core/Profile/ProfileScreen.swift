//
//  ProfileScreen.swift
//  AIChatBot
//
//  Created by Nando on 8/15/25.
//

import SwiftUI

struct ProfileScreen: View {
    @State private var navManager = NavigationManager()
    
    var body: some View {
        NavigationStack(path: $navManager.path) {
            Text("Profile")
                .navigationTitle("Profile")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        SettingsButton(navManager: navManager)
                    }
                }
                .settingsDestinations()
        }
    }
}

#Preview {
    ProfileScreen()
}
