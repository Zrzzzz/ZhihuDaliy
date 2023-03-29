//
//  NewsTableViewCell.swift
//  Zhihu Daily
//
//  Created by Zr埋 on 2019/11/19.
//  Copyright © 2019 Zr埋. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
     
    let width:CGFloat = UIScreen.main.bounds.width
    var title: UILabel!
    var hint: UILabel!
    var genderLabel: UILabel!
    var Imv: UIImageView!

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style,reuseIdentifier: reuseIdentifier)
        
//        MARK: - 图片
        Imv = UIImageView(frame: CGRect(x: width - 80, y: 10, width: 60, height: 60))
        
//        MARK: - 标题
        title = UILabel(frame: CGRect(x: 5, y: 5, width: 280, height: 40))
        title.numberOfLines = 2
        title.textColor = .black
        title.font = UIFont.boldSystemFont(ofSize: 16)
        title.textAlignment = .left
        title.lineBreakMode = .byWordWrapping
        
//        MARK: - 提示
        hint = UILabel(frame: CGRect(x: 5, y: 55, width: width-94, height: 13))
        hint.textColor = .black
        hint.font = UIFont.systemFont(ofSize: 12, weight: .light)
        
        contentView.addSubview(Imv)
        contentView.addSubview(title)
        contentView.addSubview(hint)
        
        
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
