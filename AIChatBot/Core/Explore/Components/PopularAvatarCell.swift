//
//  PopularAvatarCell.swift
//  AIChatBot
//
//  Created by Nando on 8/18/25.
//

import SwiftUI

struct PopularAvatarCell: View {
    var avatar: DBAvatarModel
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            ImageLoaderViewBuilder(urlString: Constants.randomImageUrl)
                .frame(width: 75, height: 75)
                .clipShape(.rect(cornerRadius: 8))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(avatar.name)
                    .font(.headline)
                Text(avatar.characterDescription)
            }
            .padding(.vertical, 4)
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(maxHeight: 75)
        }
    }
}

#Preview {
    PopularAvatarCell(avatar: .mock)
        .padding(.horizontal)
}
