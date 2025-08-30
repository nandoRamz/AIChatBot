//
//  ListFormSectionStyle.swift
//  AIChatBot
//
//  Created by Nando on 8/20/25.
//

import SwiftUI

struct ListFormSectionStyle<TitleButton: View>: ViewModifier {
    var title: String
    var titlePadding: CGFloat = 32
    @ViewBuilder var titleButton: TitleButton
    
    func body(content: Content) -> some View {
        VStack(spacing: 8) {
            HStack(spacing: 8) {
                Text(title.uppercased())
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                titleButton
            }
            .padding(.horizontal, titlePadding)
            
            content
        }
    }
}

extension View {
    func listFormSectionStyle<TitleButton: View>(
        title: String,
        titlePadding: CGFloat = 32,
        @ViewBuilder titleButton: @escaping () -> TitleButton = { EmptyView() }
    ) -> some View {
        self
            .modifier(
                ListFormSectionStyle(
                    title: title,
                    titlePadding: titlePadding,
                    titleButton: titleButton
                )
            )
    }
}
