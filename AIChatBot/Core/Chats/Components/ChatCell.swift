//
//  ChatCell.swift
//  AIChatBot
//
//  Created by Nando on 8/19/25.
//

import SwiftUI

struct ChatCell: View {
    var body: some View {
        HStack(spacing: 8) {
            image
            message
            newBadgeIcon
        }
    }
}

// MARK: - Views
/// Views
extension ChatCell {
    private var image: some View {
        ImageLoaderViewBuilder(urlString: Constants.randomImageUrl)
            .frame(width: 50, height: 50)
            .clipShape(.circle)
    }
    
    private var message: some View {
        VStack(alignment: .leading) {
            Text("Alpha")
                .font(.headline)
            Text("Hey, how are you?")
                .foregroundStyle(.secondary)
                .lineLimit(1)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var newBadgeIcon: some View {
        Text("New")
            .font(.footnote)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(.accent)
            .clipShape(.rect(cornerRadius: 4))
    }
}

#Preview {
    ChatCell()
        .padding(.horizontal)
}
