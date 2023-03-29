//
//  LongComments.swift
//  Zhihu Daily
//
//  Created by Zr埋 on 2019/11/24.
//  Copyright © 2019 Zr埋. All rights reserved.
//

import UIKit
import SDWebImage

class LongComments: UIViewController {

    
    var id: String = String()

    override func viewDidLoad() {
        super.viewDidLoad()
//        MARK: - tableView
        let tableView = UITableView(frame: CGRect(x: 0, y: 70, width: view.bounds.width, height: view.bounds.height - 70), style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        Alama.getComments(someclosure: {
            tableView.reloadData()
            self.navigationItem.title = "\(CommentDataSource.share.count)条评论"
        }, id: id)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
extension LongComments: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        CommentDataSource.share.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CommentsTableViewCell().contentHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "cellid"
        var cell: CommentsTableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellid) as? CommentsTableViewCell
        if cell == nil {
            cell = CommentsTableViewCell(style: .subtitle, reuseIdentifier: cellid)
        }
        cell?.avatar?.sd_setImage(with: CommentDataSource.share.avatars[indexPath.row], placeholderImage: UIImage(named: "miku"))
        cell?.name?.text = CommentDataSource.share.authors[indexPath.row]
        cell?.content.text = CommentDataSource.share.contents[indexPath.row]
        
        return cell!
    }
    
}

