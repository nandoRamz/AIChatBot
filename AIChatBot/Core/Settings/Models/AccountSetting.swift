//
//  AccountSetting.swift
//  AIChatBot
//
//  Created by Nando on 8/20/25.
//

import SwiftUI

enum AccountSetting: String, Hashable, CaseIterable, Setting {
    case status
    case deleteAccount = "delete account"
    
    var title: String { self.rawValue.capitalized }
    
    var color: Color {
        switch self {
        case .deleteAccount: Color.red
        default: Color.primary
        }
    }
}
