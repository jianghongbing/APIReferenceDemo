//
//  ViewController.swift
//  UIControl
//
//  Created by pantosoft on 2017/9/12.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let controlEventHandler = ControlEventHandler()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UIControl:实现了一些view的事件处理机制,可以通过target_action的模式来快速响应指定的事件
        let control = TestControl(frame: CGRect(x: 100, y: 100, width: 150, height: 150))
        control.backgroundColor = .red
        
        //1.control是否enable, 如果为false, control将不会处理相关事件,默认为true
        let isEnable = control.isEnabled
        
        //2.control是否被选中状态
        let isSelected = control.isSelected
        //3.control是否为高亮状态
        let isHighlighted = control.isHighlighted
        //4.水平方向上和垂直方向上内容的布局
        let contentHorizontalAlignment = control.contentHorizontalAlignment
        let contentVerticalAlignment = control.contentVerticalAlignment
        //5.获取当前control的状态
        let controlState = control.state
        //
        let isTracking = control.isTracking
        //
        let isTouchInside = control.isTouchInside
        
        
        
        view.addSubview(control)
    }
}

