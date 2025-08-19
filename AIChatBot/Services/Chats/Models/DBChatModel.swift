//
//  DBChatModel.swift
//  AIChatBot
//
//  Created by Nando on 8/19/25.
//

import Foundation

typealias DBChatModelKeys = DBChatModel.CodingKeys

struct DBChatModel: Codable, Hashable {
    var id: String
    var avatarId: String
    var creatorId: String // basically the user id
    var createdAt: Date
    var updatedAt: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case avatarId = "avatar_id"
        case creatorId = "creator_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - Mocks
/// Mocks
extension DBChatModel {
    static var mock: DBChatModel { mocks[0] }
    
    static var mocks: [DBChatModel] {
        [
            .init(
                id: "mock_chat_1",
                avatarId: "avatar_1",
                creatorId: "user_id",
                createdAt: .make(year: 2025, month: 5, day: 17, hour: 8, minute: 0, second: 0),
                updatedAt: .make(year: 2025, month: 5, day: 17, hour: 9, minute: 0, second: 0)
            ),
            .init(
                id: "mock_chat_2",
                avatarId: "avatar_2",
                creatorId: "user_id",
                createdAt: .make(year: 2025, month: 3, day: 17, hour: 8, minute: 0, second: 0),
                updatedAt: .make(year: 2025, month: 4, day: 17, hour: 9, minute: 0, second: 0)
            ),
            .init(
                id: "mock_chat_3",
                avatarId: "avatar_3",
                creatorId: "user_id",
                createdAt: .make(year: 2025, month: 2, day: 17, hour: 8, minute: 0, second: 0),
                updatedAt: .make(year: 2025, month: 3, day: 17, hour: 9, minute: 0, second: 0)
            ),
            .init(
                id: "mock_chat_4",
                avatarId: "avatar_4",
                creatorId: "user_id",
                createdAt: .make(year: 2025, month: 1, day: 17, hour: 8, minute: 0, second: 0),
                updatedAt: .make(year: 2025, month: 4, day: 17, hour: 9, minute: 0, second: 0)
            )
        ]
    }
}
