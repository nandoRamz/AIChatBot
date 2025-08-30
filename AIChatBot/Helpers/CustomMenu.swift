//
//  CustomMenu.swift
//  AIChatBot
//
//  Created by Nando on 8/30/25.
//

import SwiftUI

struct CustomMenu<T: Hashable & MenuSelectable, Label: View>: View {
    var groups: [[T]]
    var isSorted: Bool = true
    var onItemPress: (T) -> Void
    @ViewBuilder var label: Label
    
    var body: some View {
        Menu {
            ForEach(groups.indices, id: \.self) { index in
                let group = groups[index]
                let items = isSorted ? group.sorted(by: {$0.title < $1.title}) : group
                
                ForEach(items, id: \.self) { item in
                    menuButton(for: item)
                }
                
                Divider()
            }
        } label: {
            label
        }
    }
}

// MARK: - Views
/// Views
extension CustomMenu {
    @ViewBuilder
    private func menuButton(for item: T) -> some View {
        if let systemImage = item.systemImage {
            Button(
                item.title,
                systemImage: systemImage,
                role: item.role,
                action: { onItemPress(item) }
            )
        } else {
            Button(
                item.title,
                role: item.role,
                action: { onItemPress(item) }
            )
        }
    }
}

#Preview {
    CustomMenu(
        groups: [
            [MenuOption.setting],
            [MenuOption.home],
            [MenuOption.delete]
        ],
        onItemPress: { item in
            print(item.title)
        },
        label: {
            Image(systemName: "gear")
        }
    )
}

// MARK: - Mock
/// Mock
private enum MenuOption: String, MenuSelectable, CaseIterable {
    case user
    case home
    case setting
    case delete
    
    var title: String { self.rawValue.capitalized }
    
    var systemImage: String? {
        switch self {
        case .setting: "gear"
        case .delete: "trash"
        default: nil
        }
    }
    
    var role: ButtonRole? {
        switch self {
        case .delete: return .destructive
        default: return nil
        }
    }
}

// Add file if missing
/*
 protocol MenuSelectable {
     var title: String { get }
     var systemImage: String? { get }
     var role: ButtonRole? { get }
 }

 extension MenuSelectable {
     var systemImage: String? { nil }
     var role: ButtonRole? { nil }
 }
 */
