//
//  CustomAlert.swift
//  AIChatBot
//
//  Created by Nando on 8/30/25.
//

import SwiftUI

struct CustomAlert<Actions: View>: ViewModifier {
    @Binding var alert: UIAlert?
    @ViewBuilder var actions: () -> Actions
    
    func body(content: Content) -> some View {
        content
            .alert(
                alert?.title ?? "Error",
                isPresented: .init(optionalValue: $alert),
                actions: {
                    actions()
                    Button("Cancel", action: {})
                },
                message: {
                    if let message = alert?.message {
                        Text(message)
                    }
                }
            )
    }
}

// MARK: - Helper
/// Helper
extension View {
    func customAlert<Actions: View>(
        _ alert: Binding<UIAlert?>,
        @ViewBuilder actions: @escaping () -> Actions = { EmptyView() }
    ) -> some View {
        self
            .modifier(
                CustomAlert(
                    alert: alert,
                    actions: actions
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
