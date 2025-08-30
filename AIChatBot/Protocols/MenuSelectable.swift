//
//  MenuSelectable.swift
//  AIChatBot
//
//  Created by Nando on 8/30/25.
//

import SwiftUI

protocol MenuSelectable {
    var title: String { get }
    var systemImage: String? { get }
    var role: ButtonRole? { get }
}

extension MenuSelectable {
    var systemImage: String? { nil }
    var role: ButtonRole? { nil }
}
