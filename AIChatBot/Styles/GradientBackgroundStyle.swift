//
//  GradientBackgroundStyle.swift
//  AIChatBot
//
//  Created by Nando on 8/18/25.
//

import SwiftUI

struct GradientBackgroundStyle: ViewModifier {
    var startPoint: UnitPoint = .bottom
    var endPoint: UnitPoint = .top
    func body(content: Content) -> some View {
        content
            .background(gradient)
    }
}
   
// MARK: - Views
/// Views
extension GradientBackgroundStyle {
    private var gradient: some View {
        LinearGradient(
            colors: [
                .black.opacity(0.8),
                .black.opacity(0.5),
                .black.opacity(0.3),
                .black.opacity(0.0)
            ],
            startPoint: startPoint,
            endPoint: endPoint
        )
    }
}

extension View {
    func gradientBackgroundStyle(startPoint: UnitPoint = .bottom, endPoint: UnitPoint = .top) -> some View {
        self
            .modifier(GradientBackgroundStyle(startPoint: startPoint, endPoint: endPoint))
    }
}
