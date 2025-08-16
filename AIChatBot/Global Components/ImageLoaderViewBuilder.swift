//
//  ImageLoaderViewBuilder.swift
//  AIChatBot
//
//  Created by Nando on 8/16/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderViewBuilder<BackgroundFill: ShapeStyle>: View {
    var urlString: String?
    var contentMode: ContentMode
    var backgroundFill: () -> BackgroundFill
    var forceDraw: Bool
    
    init(
        urlString: String?,
        contentMode: ContentMode = .fill,
        @ViewBuilder backgroundFill: @escaping () -> BackgroundFill = { AnyShapeStyle(.ultraThinMaterial) },
        forceDraw: Bool = false
    ) {
        self.urlString = urlString
        self.contentMode = contentMode
        self.backgroundFill = backgroundFill
        self.forceDraw = forceDraw
    }
    
    var body: some View {
        if forceDraw {
            forceDrawView
        } else {
            unforceDrawView
        }
    }
}

// MARK: - Views
/// Views
extension ImageLoaderViewBuilder {
    private var rectangle: some View {
        Rectangle()
            .fill(forceDraw ? AnyShapeStyle(.ultraThinMaterial) : AnyShapeStyle(backgroundFill()))
    }
    
    private var forceDrawView: some View {
        Rectangle()
            .fill(.clear)
            .overlay { image }
            .drawingGroup()
            .clipped()
            .overlay {
                if urlString == nil {
                    ZStack {
                        Rectangle()
                            .fill(backgroundFill())
                        
                        ProgressView()
                    }
                }
            }
    }
    
    private var unforceDrawView: some View {
        Rectangle()
            .fill(backgroundFill())
            .overlay { image }
            .overlay {
                if urlString == nil { ProgressView() }
            }
    }
    
    @ViewBuilder
    private var image: some View {
        if let urlString {
            WebImage(url: URL(string: urlString))
                .resizable()
//                .scaledToFill()
                .aspectRatio(contentMode: contentMode)
                .allowsHitTesting(false)
        }
    }
}

#Preview {
    ImageLoaderViewBuilder(urlString: Constants.randomImageUrl)
}
