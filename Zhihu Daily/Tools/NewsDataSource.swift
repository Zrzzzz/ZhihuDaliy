//
//  NewsDataSource.swift
//  Zhihu Daily
//
//  Created by Zr埋 on 2019/11/18.
//  Copyright © 2019 Zr埋. All rights reserved.
//
import UIKit

struct NewsDataSource {
    static var share:NewsDataSource = {
        let newsDataSource = NewsDataSource()
        return newsDataSource
    }()
    var titles = [String]()
    var imageUrls = [URL]()
    var hints = [String]()
    var ids = [String]()
}


