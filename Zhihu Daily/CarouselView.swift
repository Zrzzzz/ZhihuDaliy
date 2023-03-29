//
//  CarouselView.swift
//  Zhihu Daily
//
//  Created by Zr埋 on 2019/11/20.
//  Copyright © 2019 Zr埋. All rights reserved.
//

import UIKit
import SDWebImage

class CarouselView: UIScrollView {
    let width = UIScreen.main.bounds.width
    func createNewView(imageName: [URL], height: CGFloat) {
        for i in 0...(imageName.count - 1) {
            let imageView = UIImageView(frame: CGRect(x: CGFloat(i) * width, y: 0, width: width, height: height))
            imageView.sd_setImage(with: imageName[i], completed: nil)
        }
        self.contentSize = CGSize(width: CGFloat(imageName.count) * width, height: height)
        self.bounces = false
        self.isPagingEnabled = true
        
        let imageView = UIImageView(frame: CGRect(x: CGFloat(imageName.count) * width, y: 0, width: width, height: height))
        imageView.sd_setImage(with: imageName[0], completed: nil)
        self.addSubview(imageView)
    }
//    func setTimer() {
//        let timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(timerManager), userInfo: nil, repeats: true)
//        RunLoop.current.add(timer, forMode: RunLoop.Mode.common)
//    }
//    @objc func timerManager() {
//        if
//    }
}
