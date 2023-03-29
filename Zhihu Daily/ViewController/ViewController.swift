//
//  ViewController.swift
//  Zhihu Daily
//
//  Created by Zr埋 on 2019/11/11.
//  Copyright © 2019 Zr埋. All rights reserved.
//

import UIKit
import SDWebImage
import Alamofire

class ViewController: UIViewController {
    
    var tableView : UITableView!
    var cnt : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
//        MARK: - 轮播图
        var cycleScrollView = CYCycleScrollView()
        cycleScrollView = CYCycleScrollView(frame: CGRect(x: 0, y: 89, width: view.frame.width, height: 200))
        view.addSubview(cycleScrollView)
        cycleScrollView.imageNames = [
               "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F2020-06-03%2F5ed769a931db1.jpg&refer=http%3A%2F%2Fpic1.win4000.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1628949694&t=2a6ed2d9fe53333b9c0a740c7b2a35f4",
               "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F2020-06-03%2F5ed769a931db1.jpg&refer=http%3A%2F%2Fpic1.win4000.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1628949694&t=2a6ed2d9fe53333b9c0a740c7b2a35f4",
               "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F2020-06-03%2F5ed769a931db1.jpg&refer=http%3A%2F%2Fpic1.win4000.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1628949694&t=2a6ed2d9fe53333b9c0a740c7b2a35f4"
               ]
//        let cycleScrollView = CarouselView()
//        cycleScrollView.createNewView(imageName: NewsDataSource.share.imageUrls, height: 200)
//       MARK: - 顶部栏设置
        let title = UILabel()
        title.text = "知乎日报"
        title.textColor = .darkGray
        title.font = UIFont.systemFont(ofSize: 28, weight: .heavy)
        title.sizeToFit()
        navigationItem.titleView = title
        let date = Date.init()
        let timeFormatter = DateFormatter.init()
        timeFormatter.dateFormat = "dd\nMM日"
        let time = timeFormatter.string(from: date)
        let dateLabel = UILabel()
        dateLabel.text = time
        dateLabel.textColor = .black
        dateLabel.numberOfLines = 0
        dateLabel.frame = CGRect(x: 20, y: 200, width: 100, height: 60)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: dateLabel)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person"), landscapeImagePhone: nil, style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = .black

//        MARK: - tableView
        
        tableView = UITableView(frame: CGRect(x: 0, y: 255, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        view.insertSubview(tableView, belowSubview: cycleScrollView)
    
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
            Alama.getNews(someclosure: self.tableView.reloadData)
        }
    }
    
    @objc func back() {
        navigationController?.popViewController(animated: true)
    }
    

}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NewsDataSource.share.titles.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "testCellID"
        var cell: NewsTableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellid) as? NewsTableViewCell
        if cell == nil {
            cell = NewsTableViewCell(style: .subtitle, reuseIdentifier: cellid)
        }
        cell?.title?.text = NewsDataSource.share.titles[indexPath.row]
        cell?.hint?.text = NewsDataSource.share.hints[indexPath.row]
        cell?.Imv?.sd_setImage(with: NewsDataSource.share.imageUrls[indexPath.row], placeholderImage: UIImage(named: "miku"))
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailNews = NewsDetail()
        detailNews.id = NewsDataSource.share.ids[indexPath.row]
        navigationController?.pushViewController(detailNews, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
