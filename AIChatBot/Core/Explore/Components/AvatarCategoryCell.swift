//
//  AvatarCategoryCell.swift
//  AIChatBot
//
//  Created by Nando on 8/18/25.
//

import SwiftUI

struct AvatarCategoryCell: View {
    var title: String
    var imageUrl: String
    
    var body: some View {
        ZStack {
            ImageLoaderViewBuilder(urlString: imageUrl)
            titleText
        }
        .clipShape(.rect(cornerRadius: 15))
    }
}

// MARK: - Views
/// Views
extension AvatarCategoryCell {
    private var titleText: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.all)
            .gradientBackgroundStyle()
            .frame(maxHeight: .infinity, alignment: .bottom)
    }
}

#Preview {
    AvatarCategoryCell(
        title: DBAvatarModel.mock.name,
        imageUrl: DBAvatarModel.mock.imageUrl
    )
    .aspectRatio(9/16, contentMode: .fit)
    .frame(height: 300)
    .clipped()
}
