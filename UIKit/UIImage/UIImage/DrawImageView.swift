//
//  DrawImageView.swift
//  UIImage
//
//  Created by pantosoft on 2017/11/29.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class DrawImageView: UIView {
    override func draw(_ rect: CGRect) {
        if let image = UIImage.init(named: "1") {
            //1.从某个点开始绘制图片
            //        image.draw(at: CGPoint(x: rect.midX, y: rect.midY))
            //2.在某个区域中绘制图片
//            image.draw(in: CGRect(x: 0, y: 0, width: image.size.width * 2, height: image.size.height * 2))
            //3.在某个区域中,以平铺的方式绘制图片
//            image.drawAsPattern(in: CGRect(x: 0, y: 0, width: image.size.width * 2, height: image.size.height * 2))
            //4.带有混合模式的绘制图片
            image.draw(at: .zero, blendMode: .darken, alpha: 0.5)
            image.draw(in:CGRect(x: 0, y: 0, width: image.size.width * 2, height: image.size.height * 2) , blendMode: .color, alpha: 0.8)
        }
    }
}
