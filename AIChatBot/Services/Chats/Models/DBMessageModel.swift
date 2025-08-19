//
//  DBMessageModel.swift
//  AIChatBot
//
//  Created by Nando on 8/19/25.
//

import Foundation

typealias DBMessageModelKeys = DBMessageModel.CodingKeys

struct DBMessageModel: Codable {
    var id: String
    var creatorId: String
    var chatId: String
    var text: String
    var seenByIds: [String]
    var createdAt: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case creatorId = "creator_id"
        case chatId = "chat_id"
        case text
        case seenByIds = "seen_by_ids"
        case createdAt = "created_at"
    }
}

// MARK: - Mocks
/// Mocks
extension DBMessageModel {
    var mock: DBMessageModel { mocks[0] }
    
    var mocks: [DBMessageModel] {
        [
            .init(
                id: "msg_001",
                creatorId: "user_001",
                chatId: "chat_001",
                text: "Hey! How’s it going?",
                seenByIds: ["user_002"],
                createdAt: .make(year: 2024, month: 8, day: 10, hour: 10, minute: 15)
            ),
            .init(
                id: "msg_002",
                creatorId: "user_002",
                chatId: "chat_001",
                text: "All good here, just got back from the gym.",
                seenByIds: ["user_001", "user_003"],
                createdAt: .make(year: 2024, month: 8, day: 10, hour: 10, minute: 17)
            ),
            .init(
                id: "msg_003",
                creatorId: "user_003",
                chatId: "chat_001",
                text: "Nice, what did you hit today?",
                seenByIds: ["user_001", "user_002"],
                createdAt: .make(year: 2024, month: 8, day: 10, hour: 10, minute: 18)
            ),
            .init(
                id: "msg_004",
                creatorId: "user_001",
                chatId: "chat_002",
                text: "Don’t forget we have a meeting later at 3pm.",
                seenByIds: [],
                createdAt: .make(year: 2024, month: 8, day: 11, hour: 9, minute: 0)
            ),
            .init(
                id: "msg_005",
                creatorId: "user_004",
                chatId: "chat_003",
                text: "Happy Birthday 🎉🥳",
                seenByIds: ["user_001", "user_002", "user_003"],
                createdAt: .make(year: 2024, month: 8, day: 12, hour: 8, minute: 45)
            )
        ]
    }
}
