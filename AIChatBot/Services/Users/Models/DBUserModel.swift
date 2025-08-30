//
//  DBUserModel.swift
//  AIChatBot
//
//  Created by Nando on 8/20/25.
//

import Foundation

struct DBUserModel {
    var id: String
    var didCompleteOnboarding: Bool
    var profileHexColor: String
    var createdAt: Date
}

// MARK: - Mocks
/// Mocks
extension DBUserModel {
    static var mock: DBUserModel { mocks[0] }
    
    static var mocks: [DBUserModel] {
        [
            .init(
                id: "user_001",
                didCompleteOnboarding: true,
                profileHexColor: "#3498db", // blue
                createdAt: .make(year: 2025, month: 1, day: 17)
            ),
            .init(
                id: UUID().uuidString,
                didCompleteOnboarding: false,
                profileHexColor: "#e74c3c", // red
                createdAt: .make(year: 2025, month: 2, day: 17)
            ),
            .init(
                id: UUID().uuidString,
                didCompleteOnboarding: true,
                profileHexColor: "#2ecc71", // green
                createdAt: .make(year: 2025, month: 3, day: 17)
            ),
            .init(
                id: UUID().uuidString,
                didCompleteOnboarding: true,
                profileHexColor: "#9b59b6", // purple
                createdAt: .make(year: 2025, month: 4, day: 17)
            )
        ]
    }
}
