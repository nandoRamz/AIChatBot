//
//  ApplicationSetting.swift
//  AIChatBot
//
//  Created by Nando on 8/20/25.
//

import SwiftUI

enum ApplicationSetting: String, Hashable, CaseIterable, Setting {
    case version
    case buildNumber = "build number"
    case contactUs = "contact us"
    
    var title: String { self.rawValue.capitalized }
    
    var color: Color {
        switch self {
        case .contactUs: Color.accent
        default: Color.primary
        }
    }
}
