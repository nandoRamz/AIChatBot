//
//  MyAvatarCell.swift
//  AIChatBot
//
//  Created by Nando on 8/20/25.
//

import SwiftUI

struct MyAvatarCell: View {
    var avatar: DBAvatarModel
    
    var body: some View {
        HStack(spacing: 8) {
            image
            nameText
        }
    }
}

// MARK: - Views
/// Views
extension MyAvatarCell {
    private var image: some View {
        ImageLoaderViewBuilder(urlString: avatar.imageUrl)
            .frame(width: 50, height: 50)
            .clipShape(.rect(cornerRadius: 4))
    }
    
    private var nameText: some View {
        Text(avatar.name)
            .font(.headline)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    MyAvatarCell(avatar: .mock)
        .padding(.horizontal)
}
