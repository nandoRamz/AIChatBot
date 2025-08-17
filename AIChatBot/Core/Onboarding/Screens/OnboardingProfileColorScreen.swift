//
//  OnboardingProfileColorScreen.swift
//  AIChatBot
//
//  Created by Nando on 8/17/25.
//

import SwiftUI

struct OnboardingProfileColorScreen: View {
    @State private var selectedColor: Color?
    
    private let colors: [Color] = [.red, .green, .orange, .blue, .mint, .purple, .cyan, .teal, .indigo]
    
    var navManager: NavigationManager
    
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
                    if let _ = selectedColor {
                        continueButton
                            .transition(.move(edge: .bottom))
                    }
                }
                .padding(.all)
            }
        )
        .navigationTitle("Select a profile color")
        .animation(.smooth, value: selectedColor)
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
                        .padding(selectedColor == color ? 8 : 0)
                }
                .onTapGesture { onColorPress(color) }
        }
    }
    
    private var continueButton: some View {
        PrimaryButton(
            title: "Continue",
            action: { onContinuePress() }
        )
    }
}

// MARK: - Actions
/// Actions
extension OnboardingProfileColorScreen {
    private func onColorPress(_ color: Color) {
        selectedColor = color
    }
    
    private func onContinuePress() {
        navManager.path.append(OnboardingDestination.completed)
    }
}

#Preview {
    NavigationStack {
        OnboardingProfileColorScreen(navManager: NavigationManager())
    }
}
