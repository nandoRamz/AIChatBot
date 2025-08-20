//
//  PrimaryButton.swift
//  AIChatBot
//
//  Created by Nando on 8/16/25.
//

import SwiftUI

struct PrimaryButton: View {
    var title: String
    var backgroundColor: Color?
    var isPerformingTask: Bool = false
    var action: () -> Void
    
    var body: some View {
        Button(action: { action() }, label: { label })
    }
}

// MARK: - Views
/// Views
extension PrimaryButton {
    private var label: some View {
        ZStack {
            Text(title)
                .font(.headline)
                .foregroundStyle(.white)
                .opacity(isPerformingTask ? 0: 1)
            
            if isPerformingTask {
                ProgressView()
                    .tint(.white)
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 44)
        .background(backgroundColor ?? .accent)
        .clipShape(.rect(cornerRadius: 15))
    }
}

#Preview {
    PrimaryButton(title: "Done", action: {})
        .padding(.horizontal)
}
