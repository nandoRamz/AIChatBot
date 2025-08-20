//
//  LoginSetting.swift
//  AIChatBot
//
//  Created by Nando on 8/20/25.
//

import SwiftUI

enum LoginSetting: String, Hashable, CaseIterable, Setting {
    case signOut = "sign out"
    
    var title: String { self.rawValue.capitalized }
    
    var color: Color { Color.red }
}
