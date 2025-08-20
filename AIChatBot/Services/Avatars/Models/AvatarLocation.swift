//
//  AvatarLocation.swift
//  AIChatBot
//
//  Created by Nando on 8/17/25.
//

import Foundation

enum AvatarLocation: String, Codable, CaseIterable, Hashable, PickerSelectable {
    case park
    case mall
    case museum
    case city
    case desert
    case forest
    case space
    
    var title: String { self.rawValue.capitalized }
}
