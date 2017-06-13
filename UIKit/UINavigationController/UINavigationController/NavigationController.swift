//
//  NavigationController.swift
//  UINavigationController
//
//  Created by pantosoft on 2017/6/13.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self;
        //点击的时候是否隐藏bar, 默认为false
        hidesBarsOnTap = true
        //滑动的时候,是否隐藏navigation bar,默认为false
        hidesBarsOnSwipe = true
        //当垂直方向长度较小的时候,是否隐藏navigation bar,默认为false
        hidesBarsWhenVerticallyCompact = true
        //键盘出现的时候是否隐藏navigation bar, 默认为false 
        hidesBarsWhenKeyboardAppears = true
    }
}


extension NavigationController: UINavigationControllerDelegate {
    //将要显示navigationController栈里面的controller时,delegate会接收到该消息
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if let index = navigationController.viewControllers.index(of: viewController) {
            print("will show controller:\(viewController),index:\(index)")
        }
    }
    
    //已经显示navigationController栈里面的controller时,delegate会收到该消息
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if let index = navigationController.viewControllers.index(of: viewController) {
            print("did show controller:\(viewController),index:\(index)")
        }
    }
    
    //设置navigationController支持设备旋转的方向
    func navigationControllerSupportedInterfaceOrientations(_ navigationController: UINavigationController) -> UIInterfaceOrientationMask {
        return [.portrait, .landscapeLeft]
    }
    //设置偏爱的navigationController呈现的方式
    func navigationControllerPreferredInterfaceOrientationForPresentation(_ navigationController: UINavigationController) -> UIInterfaceOrientation {
        return .portrait
    }
    
    
    


}

