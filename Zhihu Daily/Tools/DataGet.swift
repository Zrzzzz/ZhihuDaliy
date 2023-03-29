//
//  DataGet.swift
//  Zhihu Daily
//
//  Created by Zr埋 on 2019/11/14.
//  Copyright © 2019 Zr埋. All rights reserved.
//

import UIKit

// MARK: - DataGet
struct DataGet: Codable {
    let date: String
    let stories, topStories: [Story]

    enum CodingKeys: String, CodingKey {
        case date, stories
        case topStories = "top_stories"
    }
}

// MARK: - Story
struct Story: Codable {
    let imageHue, title: String
    let url: String
    let hint, gaPrefix: String
    let images: [URL]?
    let type, id: Int
    let image: URL?

    enum CodingKeys: String, CodingKey {
        case imageHue = "image_hue"
        case title, url, hint
        case gaPrefix = "ga_prefix"
        case images, type, id, image
    }
}
