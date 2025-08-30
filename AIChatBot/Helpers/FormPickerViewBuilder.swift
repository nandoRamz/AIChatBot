//
//  FormPickerViewBuilder.swift
//  AIChatBot
//
//  Created by Nando on 8/20/25.
//

import SwiftUI

struct FormPickerViewBuilder<T: Hashable & PickerSelectable>: View {
    var title: String
    @Binding var selectedItem: T
    var items: [T]
    var isShowingDivider: Bool = true
    
    var body: some View {
        HStack {
            Text(title.capitalized)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Picker("", selection: $selectedItem) {
                ForEach(items, id: \.self) { type in
                    Text(type.title)
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 11)
        .background(
            Divider()
                .padding(.leading, 16)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .opacity(isShowingDivider ? 1 : 0)
        )
    }
}

// MARK: - Preview
/// Preview
private struct Preview: View {
    @State var selectedItem: AvatarType = .man
    
    var body: some View {
        FormPickerViewBuilder(
            title: "Type",
            selectedItem: $selectedItem,
            items: AvatarType.allCases
        )
    }
}

#Preview {
     Preview()
}
