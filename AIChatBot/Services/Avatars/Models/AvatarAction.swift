//
//  AvatarAction.swift
//  AIChatBot
//
//  Created by Nando on 8/17/25.
//

import Foundation

enum AvatarAction: String, Codable, CaseIterable, Hashable, PickerSelectable {
    case smiling
    case sitting
    case eating
    case drinking
    case walking
    case shopping
    case studying
    case working
    case relaxing
    case fighting
    case crying
    
    var title: String { self.rawValue.capitalized }
}
