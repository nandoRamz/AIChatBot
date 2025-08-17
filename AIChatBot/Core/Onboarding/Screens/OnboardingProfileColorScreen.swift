//
//  OnboardingProfileColorScreen.swift
//  AIChatBot
//
//  Created by Nando on 8/17/25.
//

import SwiftUI

struct OnboardingProfileColorScreen: View {
    private let colors: [Color] = [.red, .green, .orange, .blue, .mint, .purple, .cyan, .teal, .indigo]
    
    var navManager: NavigationManager
    var manager: OnboardingManager
    
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 3),
                spacing: 16,
                content: {
                    colorCollection
                }
            )
        }
        .contentMargins(.all, 16)
        .safeAreaInset(
            edge: .bottom,
            alignment: .center,
            content: {
                ZStack {
                    if manager.profileColor != nil {
                        continueButton
                            .transition(.move(edge: .bottom))
                    }
                }
                .padding(.all)
            }
        )
        .navigationTitle("Select a profile color")
        .animation(.smooth, value: manager.profileColor)
    }
}

// MARK: - Views
/// Views
extension OnboardingProfileColorScreen {
    private var colorCollection: some View {
        ForEach(colors, id: \.self) { color in
            Circle()
                .fill(.accent)
                .overlay {
                    color
                        .clipShape(.circle)
                        .padding(manager.profileColor == color ? 8 : 0)
                }
                .onTapGesture { onColorPress(color) }
        }
    }
    
    private var continueButton: some View {
        PrimaryButton(
            title: "Continue",
            backgroundColor: manager.profileColor,
            action: { onContinuePress() }
        )
    }
}

// MARK: - Actions
/// Actions
extension OnboardingProfileColorScreen {
    private func onColorPress(_ color: Color) {
        manager.profileColor = color
    }
    
    private func onContinuePress() {
        navManager.path.append(OnboardingDestination.completed)
    }
}

#Preview {
    NavigationStack {
        OnboardingProfileColorScreen(navManager: NavigationManager(), manager: OnboardingManager())
    }
}
