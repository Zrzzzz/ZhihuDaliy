//
//  CommentDataSource.swift
//  Zhihu Daily
//
//  Created by Zr埋 on 2019/11/25.
//  Copyright © 2019 Zr埋. All rights reserved.
//
import Foundation

struct CommentDataSource {
    static var share: CommentDataSource = {
        let commentDataSource = CommentDataSource()
        return commentDataSource
    }()
    var count = Int()
    var authors = [String]()
    var contents = [String]()
    var avatars = [URL]()
    
}
