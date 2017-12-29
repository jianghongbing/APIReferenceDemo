//
//  ViewController.swift
//  UITraitCollection
//
//  Created by pantosoft on 2017/12/15.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //UITraitCollection:表示当前app所在的环境
        //UITraitCollection的作用
        //1.在特定的环境中,设置指定的选项,比如视图的外观
        //2.当环境发生改变时,对视图进行相应的调整
        //3.UITraitCollection中包含的选项
        let traitCollection = self.traitCollection
        //3.1 水平和垂直方向上的sizeClass类型
        let horizontalSizeClass = traitCollection.horizontalSizeClass
        let verticalSizeClass = traitCollection.verticalSizeClass
        //3.2 显示比例在当前的环境中,在retina设备上是2.0,在iPhone plus设备上是3.0
        let displayScale = traitCollection.displayScale
        //3.3 当前环境中,颜色显示的类型
        let displayGamut = traitCollection.displayGamut
        //3.4 用户界面所在当前设备中的类型
        let userInterfaceIdiom = traitCollection.userInterfaceIdiom
        //3.5 3dTouch能力
        let forceTouchCapability = traitCollection.forceTouchCapability
        //3.6 内容布局方向
        let layoutDirection = traitCollection.layoutDirection
        //3.7 用户界面样式,使用与apple tv
        //        let userInterfaceStyle = traitCollection.userInterfaceStyle
        print(horizontalSizeClass.rawValue,verticalSizeClass.rawValue,displayScale,displayGamut.rawValue,userInterfaceIdiom.rawValue,forceTouchCapability.rawValue,layoutDirection.rawValue)
    }
    
    //对traitCollection发生改变时做出的响应,如(需要改变视图的大小,以及动画等)
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
        if newCollection.horizontalSizeClass == .compact {
            widthConstraint.constant = 100;
            heightConstraint.constant = 100;
        }else if newCollection.horizontalSizeClass == .regular {
            widthConstraint.constant = 200;
            heightConstraint.constant = 200;
        }
        self.view.layoutIfNeeded()
    }
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if let previousTraitCollection = previousTraitCollection {
            //当app所在的环境发生改变时,当前控制器会收到该消息
            print("traitCollectionDidChange:\(previousTraitCollection)")
        }
    }
}

