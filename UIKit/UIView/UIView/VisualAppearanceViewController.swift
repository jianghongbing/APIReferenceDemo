//
//  VisualAppearanceViewController.swift
//  UIView
//
//  Created by pantosoft on 2017/7/31.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class VisualAppearanceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //UIView主要用来呈现app可视化的数据内容,和处理用户和app之间的交互
        //1.UIView的外观属性
        let appearanceView = UIView(frame:CGRect(x: 100, y: 100, width: 100, height: 100))
        view.addSubview(appearanceView)
        //1.1 设置背景色
        appearanceView.backgroundColor = .red
        //1.2 设置透明度
        appearanceView.alpha = 0.5
        //1.3
//        appearanceView.isOpaque = false
        //1.4 是否隐藏该view
        appearanceView.isHidden = true
        
        
    }
}
