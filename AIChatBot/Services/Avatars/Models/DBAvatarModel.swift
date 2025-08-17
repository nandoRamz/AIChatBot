//
//  DBAvatarModel.swift
//  AIChatBot
//
//  Created by Nando on 8/17/25.
//

import Foundation

typealias DBAvatarModelKeys = DBAvatarModel.CodingKeys

struct DBAvatarModel: Codable {
    var id: String
    var creatorId: String
    var name: String
    var type: AvatarType
    var action: AvatarAction
    var location: AvatarLocation
    var imageUrl: String
    var createdAt: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case creatorId = "creator_id"
        case name
        case type
        case action
        case location
        case imageUrl = "image_url"
        case createdAt = "created_at"
    }
}

// MARK: - UI Properties
/// UI Properties
extension DBAvatarModel {
    var characterDescription: String {
        AvatarDescriptionHelper(type: type, action: action, location: location).value ?? "Description unavailable"
    }
}

// MARK: - Mocks
/// Mocks
extension DBAvatarModel {
    static var mock: DBAvatarModel { mocks[0] }
    
    static var mocks: [DBAvatarModel] {
        [
            .init(
                id: UUID().uuidString,
                creatorId: UUID().uuidString,
                name: "Alpha",
                type: .alien,
                action: .smiling,
                location: .space,
                imageUrl: Constants.randomImageUrl,
                createdAt: .now
            ),
            .init(
                id: UUID().uuidString,
                creatorId: UUID().uuidString,
                name: "Beta",
                type: .dog,
                action: .relaxing,
                location: .park,
                imageUrl: Constants.randomImageUrl,
                createdAt: .now
            ),
            .init(
                id: UUID().uuidString,
                creatorId: UUID().uuidString,
                name: "Gamma",
                type: .cat,
                action: .walking,
                location: .city,
                imageUrl: Constants.randomImageUrl,
                createdAt: .now
            ),
            .init(
                id: UUID().uuidString,
                creatorId: UUID().uuidString,
                name: "Delta",
                type: .woman,
                action: .crying,
                location: .mall,
                imageUrl: Constants.randomImageUrl,
                createdAt: .now
            )
        ]
    }
}
