//
//  SingleFormRowStyle.swift
//  AIChatBot
//
//  Created by Nando on 8/20/25.
//

import SwiftUI

struct SingleFormRowStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 16)
            .padding(.vertical, 11)
            .background(.ultraThinMaterial)
            .clipShape(.rect(cornerRadius: 15))
    }
}

// MARK: - View
/// View
extension View {
    func singleFormRowStyle() -> some View {
        self
            .modifier(SingleFormRowStyle())
    }
}
