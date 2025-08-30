//
//  Binding+Extension.swift
//  AIChatBot
//
//  Created by Nando on 8/30/25.
//

import SwiftUI

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
