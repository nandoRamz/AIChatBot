//
//  MessageCell.swift
//  AIChatBot
//
//  Created by Nando on 8/21/25.
//

import SwiftUI

struct MessageCell: View {
    private var extraPadding: CGFloat { 34 + 8 } // Image width and hstack spacing
    
    var message: DBMessageModel
    var isCurrentUser: Bool
    var imageUrl: String?
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 8) {
            image
            messageText
        }
        .frame(maxWidth: .infinity, alignment: isCurrentUser ? .trailing : .leading)
        .padding(.leading, isCurrentUser ? extraPadding : 0)
        .padding(.trailing, isCurrentUser ? 0 : extraPadding)
    }
}

// MARK: - Views
/// Views
extension MessageCell {
    @ViewBuilder
    private var image: some View {
        if let imageUrl {
            if !isCurrentUser {
                ImageLoaderViewBuilder(urlString: imageUrl)
                    .frame(width: 34, height: 34)
                    .clipShape(.circle)
                    .padding(.bottom, 4)
            }
        }
    }
    
    private var messageText: some View {
        Text(message.text)
            .foregroundStyle(isCurrentUser ? .white : .primary)
            .padding(.horizontal, 16)
            .padding(.vertical, 11)
            .background(isCurrentUser ? AnyShapeStyle(Color.accent) : AnyShapeStyle(.ultraThinMaterial))
            .clipShape(.rect(cornerRadius: 11))
    }
}

#Preview {
    VStack(spacing: 16) {
        MessageCell(
            message: .mock,
            isCurrentUser: false,
            imageUrl: Constants.randomImageUrl
        )
        MessageCell(
            message: .mock,
            isCurrentUser: true,
            imageUrl: Constants.randomImageUrl
        )
    }
    .padding(.horizontal)
}
