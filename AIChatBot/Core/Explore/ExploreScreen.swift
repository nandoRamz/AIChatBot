//
//  ExploreScreen.swift
//  AIChatBot
//
//  Created by Nando on 8/15/25.
//

import SwiftUI

struct ExploreScreen: View {
    let avatar = DBAvatarModel.mock
    
    var body: some View {
        NavigationStack {
            FeatureAvatarCell(
                title: avatar.name,
                description: avatar.characterDescription,
                imageUrl: avatar.imageUrl
            )
            .frame(height: 200)
            .navigationTitle("Explore")
        }
    }
}

#Preview {
    ExploreScreen()
}
