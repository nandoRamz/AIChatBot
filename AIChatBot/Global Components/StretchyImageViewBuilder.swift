//
//  StretchyImageViewBuilder.swift
//  AIChatBot
//
//  Created by Nando on 8/31/25.
//

import SwiftUI

struct StretchyImageViewBuilder: View {
    var imageUrlString: String
    var height: CGFloat
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            let minY = $0.frame(in: .global).minY
            let isScrollingBeyondBounds: Bool = minY > 0
            let adaptiveHeight = isScrollingBeyondBounds ? minY + height : height
            let adaptiveOffsetY = isScrollingBeyondBounds ? -minY : 0
            
            ImageLoaderViewBuilder(urlString: imageUrlString, contentMode: .fill)
                .frame(width: size.width)
                .frame(height: adaptiveHeight)
                .clipped()
                .offset(y: adaptiveOffsetY)

        }
        .frame(height: height)
    }
}

#Preview {
    ScrollView {
        StretchyImageViewBuilder(imageUrlString: Constants.randomImageUrl, height: 300)
    }
}
