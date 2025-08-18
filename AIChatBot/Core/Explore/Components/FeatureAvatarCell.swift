//
//  FeatureAvatarCell.swift
//  AIChatBot
//
//  Created by Nando on 8/17/25.
//

import SwiftUI

struct FeatureAvatarCell: View {
    var title: String
    var description: String
    var imageUrl: String?
    
    var body: some View {
        ZStack {
            ImageLoaderViewBuilder(urlString: imageUrl)
            avatarInfo
        }
        .clipShape(.rect(cornerRadius: 15))
    }
}

// MARK: - Views
/// Views
extension FeatureAvatarCell {
    private var avatarInfo: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .bold()
            Text(description)
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.all)
        .padding(.top)
        .background(backgroundGardient)
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
    
    private var backgroundGardient: some View {
        LinearGradient(
            colors: [
                .black.opacity(0.8),
                .black.opacity(0.5),
                .black.opacity(0.3),
                .black.opacity(0.0)
            ],
            startPoint: .bottom,
            endPoint: .top
        )
    }
}

#Preview {
    VStack(spacing: 16) {
        FeatureAvatarCell(
            title: "Alpha",
            description: "An alien that is smiling in the park."
        )
        .frame(height: 200)
        
        FeatureAvatarCell(
            title: "Alpha",
            description: "An alien that is smiling in the park.",
            imageUrl: Constants.randomImageUrl
        )
        .frame(height: 200)
    }
    .padding(.horizontal)
}
