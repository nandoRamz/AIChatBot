//
//  AvatarCell.swift
//  AIChatBot
//
//  Created by Nando on 8/30/25.
//

import SwiftUI

struct AvatarCell: View {
    var avatar: DBAvatarModel
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            ImageLoaderViewBuilder(urlString: Constants.randomImageUrl)
                .frame(width: 50, height: 50)
                .clipShape(.rect(cornerRadius: 8))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(avatar.name)
                    .font(.headline)
                Text(avatar.characterDescription)
            }
            .padding(.vertical, 4)
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(maxHeight: 50)
        }
    }
}

#Preview {
    AvatarCell(avatar: .mock)
}
