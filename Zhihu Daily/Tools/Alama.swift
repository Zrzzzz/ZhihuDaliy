//
//  Alama.swift
//  Zhihu Daily
//
//  Created by Zr埋 on 2019/11/17.
//  Copyright © 2019 Zr埋. All rights reserved.
//

import Alamofire
import WebKit
class Alama {
        
    static func getNews(someclosure: @escaping () -> Void) {
            let dataRequest: DataRequest = Alamofire.request("https://news-at.zhihu.com/api/4/news/latest")
            dataRequest.responseJSON { d in
                do {
                    let datas = try JSONDecoder().decode(DataGet.self, from:
                    d.data!)
                    for story in datas.stories {
                        NewsDataSource.share.titles.append(story.title)
                        NewsDataSource.share.imageUrls.append(story.images?[0] ?? URL(string: "https://tva1.sinaimg.cn/large/006y8mN6ly1g918yd645xj306o06oweg.jpg")!)
                        NewsDataSource.share.hints.append(story.hint)
                        NewsDataSource.share.ids.append(String(story.id))
                        
                    }
                someclosure()
                } catch {
                    print("error")
                }
            }
        }
    static func getComments(someclosure: @escaping () -> Void, id: String) {
        CommentDataSource.share.count = 0
        CommentDataSource.share.contents.removeAll()
        CommentDataSource.share.authors.removeAll()
        CommentDataSource.share.avatars.removeAll()
        let dataRequest: DataRequest = Alamofire.request("https://news-at.zhihu.com/api/4/story/\(id)/comments")
        print(dataRequest)
        dataRequest.responseJSON { d in
            do {
                let datas = try JSONDecoder().decode(CommentGet.self, from:
                d.data!)
                CommentDataSource.share.count = datas.count
                for comment in datas.comments {
                    CommentDataSource.share.authors.append(comment.author)
                    CommentDataSource.share.contents.append(comment.content)
                    CommentDataSource.share.avatars.append(comment.avatar)

                    someclosure()
                }

            } catch {
                print("error")
            }
        }
    }
}

