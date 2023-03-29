//
//  CommentsTableViewCell.swift
//  Zhihu Daily
//
//  Created by Zr埋 on 2019/11/25.
//  Copyright © 2019 Zr埋. All rights reserved.
//

import UIKit
import SnapKit
import SDWebImage

class CommentsTableViewCell: UITableViewCell {
     
    let width: CGFloat = UIScreen.main.bounds.width
    var name: UILabel!
    var content: UILabel!
    var genderLabel: UILabel!
    var avatar: UIImageView!
    var time: UILabel!
    var contentHeight: CGFloat!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style,reuseIdentifier: reuseIdentifier)
        
//        MARK: - 头像
        avatar = UIImageView()
        contentView.addSubview(avatar)
        avatar.layer.cornerRadius = 30
        avatar.layer.masksToBounds = true
        avatar.snp.makeConstraints { (m) in
            m.left.equalTo(5)
            m.top.equalTo(5)
            m.width.height.equalTo(40)
        }
        
//        MARK: - 昵称
        name = UILabel()
        contentView.addSubview(name)
        name.numberOfLines = 2
        name.textColor = .black
        name.font = UIFont.boldSystemFont(ofSize: 16)
        name.textAlignment = .left
        name.lineBreakMode = .byWordWrapping
        name.snp.makeConstraints { (m) in
            m.left.equalTo(70)
            m.top.equalTo(5)
            m.width.equalTo(100)
            m.height.equalTo(20)
        }
        
//        MARK: - 评论
        content = UILabel()
        contentView.addSubview(content)
        content.textColor = .black
        content.numberOfLines = 0
        content.lineBreakMode = .byWordWrapping
        content.font = UIFont.systemFont(ofSize: 24, weight: .light)
//        废除
        if content.text == nil {
            content.text = "row"
        }
        contentHeight = getHeight(content.text!, 30, width - 70)
        content.snp.updateConstraints { (m) in
            m.left.equalTo(70)
            m.top.equalTo(25)
            m.width.equalTo(width - 70)
            m.height.equalTo(contentHeight)
        }
        
//        content.dynamiclySetHeight(toSetWidth: width - 70)
//        contentHeight = content.frame.height + 20
        
        
//        MARK: - 时间
//        time = UILabel()
//        time.textColor = .gray
//        time.font = UIFont.systemFont(ofSize: 10, weight: .light)
//        time.snp.makeConstraints { (m) in
//            m.left.equalTo(5)
//            m.bottom.equalTo(5)
//            m.width.equalTo(60)
//            m.height.equalTo(20)
//        }
        
        
        
        
//        contentView.addSubview(time)
        
    }
    
    func getHeight(_ text: String, _ fontsize: CGFloat, _ setWidth: CGFloat) -> CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: setWidth, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: fontsize, weight: .medium)
        label.text = text

        label.sizeToFit()
        return label.bounds.height
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
//extension UILabel {
//    func dynamiclySetHeight(toSetWidth width: CGFloat) {
//        self.frame.size.width = width
//        self.numberOfLines = 0
//        self.lineBreakMode = .byWordWrapping
//        self.sizeToFit()
//    }
//}
