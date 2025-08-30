//
//  NewMessageCell.swift
//  AIChatBot
//
//  Created by Nando on 8/21/25.
//

import SwiftUI

struct NewMessageCell: View {
    var placeholder: String
    @Binding var text: String
    var bottomPadding: CGFloat = 16
    var onSendPress: () -> Void
    
    var body: some View {
        HStack(alignment: .bottom) {
            textField
            sendButton
        }
        .frame(minHeight: 50)
        .background(.ultraThinMaterial)
        .clipShape(.rect(cornerRadius: 25))
        .padding(.horizontal)
        .padding(.bottom, bottomPadding)
        .background(
            Color(.systemBackground)
                .frame(height: 25 + bottomPadding)
                .frame(maxHeight: .infinity, alignment: .bottom)
        )
    }
}

// MARK: - Views
/// Views
extension NewMessageCell {
    private var textField: some View {
        TextField(placeholder, text: $text, axis: .vertical)
            .lineLimit(5)
            .padding(.horizontal)
            .padding(.vertical, 11)
            .frame(minHeight: 50)
    }
    
    private var sendButton: some View {
        Image(systemName: SystemImage.send.name)
            .font(.headline)
            .foregroundStyle(.white)
            .frame(height: 42)
            .frame(width: 63)
            .background(Color.accent)
            .clipShape(.capsule)
            .onTapGesture { onSendPress() }
            .padding(.trailing, 4)
            .padding(.vertical, 4)
    }
}

// MARK: - Preview
/// Preview
private struct Preview: View {
    @State private var text: String = ""
    
    var body: some View {
        NewMessageCell(placeholder: "Message Aplha...", text: $text, onSendPress: {})
    }
}

#Preview {
    Preview()
}
