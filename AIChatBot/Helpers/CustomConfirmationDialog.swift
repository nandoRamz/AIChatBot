//
//  CustomConfirmationDialog.swift
//  AIChatBot
//
//  Created by Nando on 8/30/25.
//

import SwiftUI

struct CustomDialog: ViewModifier {
    @Binding var alert: UIAlert?
    var onActionPress: (MenuSelectable) -> Void
    
    func body(content: Content) -> some View {
        content
            .confirmationDialog(
                alert?.title ?? "",
                isPresented: .init(optionalValue: $alert),
                actions: { actionsViewBuilder },
                message: {
                    if let message = alert?.message {
                        Text(message)
                    }
                }
            )
    }
}

// MARK: - Views
/// Views
extension CustomDialog {
    @ViewBuilder
    private var actionsViewBuilder: some View {
        if let actions = alert?.actions {
            ForEach(actions, id: \.title) { action in
                if let systemImage = action.systemImage {
                    Button(
                        action.title,
                        systemImage: systemImage,
                        role: action.role,
                        action: { onActionPress(action) }
                    )
                } else {
                    Button(
                        action.title,
                        role: action.role,
                        action: { onActionPress(action) }
                    )
                }
            }
        }
        
    }
}

// MARK: - Helper
/// Helper
extension View {
    func customDialog(
        _ alert: Binding<UIAlert?>,
        onActionPress: @escaping (MenuSelectable) -> Void
    ) -> some View {
        self
            .modifier(
                CustomDialog(
                    alert: alert,
                    onActionPress: onActionPress
                )
            )
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
 
 struct UIAlert {
     var title: String = ""
     var message: String?
     var actions: [MenuSelectable] = []
 }
 
 extension Binding where Value == Bool {
     init<T>(optionalValue value: Binding<T?>) {
         self.init(
             get: { value.wrappedValue != nil },
             set: { newValue in
                 if !newValue { value.wrappedValue = nil }
             }
         )
     }
 }
 */
