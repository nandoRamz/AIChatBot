//
//  AvatarDescriptionHelper.swift
//  AIChatBot
//
//  Created by Nando on 8/17/25.
//

import Foundation

struct AvatarDescriptionHelper {
    var type: AvatarType
    var action: AvatarAction
    var location: AvatarLocation
    
    var value: String? {
        let characterSet: [Character] = ["a", "e", "i", "o", "u"]
        guard let firstCharacter = type.rawValue.first else { return nil }
        let firstWord = characterSet.contains(firstCharacter) ? "An" : "A"
        
        return "\(firstWord) \(type.rawValue) that is \(action.rawValue) in the \(location)"
    }
}
