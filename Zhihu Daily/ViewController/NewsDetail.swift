//
//  NewsDetail.swift
//  Zhihu Daily
//
//  Created by Zr埋 on 2019/11/20.
//  Copyright © 2019 Zr埋. All rights reserved.
//

import UIKit
import WebKit

class NewsDetail: UIViewController {
    
    var id: String = String()
//    var htmlString: String = String()
//    static var share: NewsDetail = {
//        let newsDetail = NewsDetail()
//        return newsDetail
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let webView = WKWebView(frame: CGRect(x: 0, y: 50, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 45))
        view.addSubview(webView)
//        Alama.getTheHTML(closure1: { s in
//            self.webView.loadHTMLString(s, baseURL: nil)
//        }, id: id)
        let request = URLRequest(url: URL(string: "https://daily.zhihu.com/story/\(id)")!)
        webView.load(request)

//        MARK: - tabBar
        
        let tabBar = UITabBar()
        tabBar.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - 45, width: UIScreen.main.bounds.width, height: 45)
        tabBar.backgroundColor = .white
        tabBar.barTintColor = .white
        view.addSubview(tabBar)
        let backBtn = UIButton()
        backBtn.backgroundColor = .clear
        backBtn.tintColor = .black
        backBtn.setImage(UIImage(named: "backArrow"), for: .normal)
        backBtn.addTarget(self, action: #selector(back), for: .touchUpInside)
        backBtn.frame = CGRect(x: 10, y: UIScreen.main.bounds.height - 45, width: 45, height: 45)
        view.addSubview(backBtn)
        let comtBtn = UIButton()
        comtBtn.backgroundColor = .clear
        comtBtn.tintColor = .black
        comtBtn.setImage(UIImage(named: "comment"), for: .normal)
        comtBtn.addTarget(self, action: #selector(comt), for: .touchUpInside)
        comtBtn.frame = CGRect(x: view.bounds.width - 55, y: UIScreen.main.bounds.height - 45, width: 45, height: 45)
        view.addSubview(comtBtn)
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)


        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    @objc func back() {
        navigationController?.popViewController(animated: true)
    }
    @objc func comt() {
        let longComments = LongComments()
        longComments.id = id
        navigationController?.pushViewController(longComments, animated: true)
    }
}
