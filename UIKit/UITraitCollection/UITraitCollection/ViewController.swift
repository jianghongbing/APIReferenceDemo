//
//  ViewController.swift
//  UITraitCollection
//
//  Created by pantosoft on 2017/12/15.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //UITraitCollection:表示当前app所在的环境
        //UITraitCollection的作用
        //1.在特定的环境中,设置指定的选项,比如视图的外观
        //2.当环境发生改变时,对视图进行相应的调整
//        let traitCollection = self.traitCollection
        
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if let previousTraitCollection = previousTraitCollection {
            print("traitCollectionDidChange:\(previousTraitCollection)")
        }
    }
}

