//
//  CommentGet.swift
//  Zhihu Daily
//
//  Created by Zr埋 on 2019/11/25.
//  Copyright © 2019 Zr埋. All rights reserved.
//

import Foundation

// MARK: - CommentGet
struct CommentGet: Codable {
    let count: Int
    let comments: [Comment]
}

// MARK: - Comment
struct Comment: Codable {
    let author, content: String
    let avatar: URL
    let time, id, likes: Int
    let replyTo: ReplyTo?

    enum CodingKeys: String, CodingKey {
        case author, content, avatar, time, id, likes
        case replyTo = "reply_to"
    }
}

// MARK: - ReplyTo
struct ReplyTo: Codable {
    let content: String
    let status, id: Int
    let author: String
}
