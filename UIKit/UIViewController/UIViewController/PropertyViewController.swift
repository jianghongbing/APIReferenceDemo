//
//  PropertyViewController.swift
//  UIViewController
//
//  Created by pantosoft on 2017/6/28.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class PropertyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //viewController的相关属性
        //1.title:标题
        title = "UIViewController"
        //2.view:controller中的view
        view.backgroundColor = .purple
        relationShipProperty()
        othersProperty()
        
    }
    
    private func othersProperty() {
        //3.获取controller所在的storyboard
        if let sb = storyboard {
            debugPrint("controller.sb:\(sb)")
        }
        //4.后去controller的nibName
        if let nibName = nibName {
            debugPrint("nibName:" + nibName)
        }
        //5.获取nib bundle
        if let bundle = nibBundle {
            debugPrint("nibBundle:\(bundle)")
        }
        //6.判断是否已经loadView
        if isViewLoaded {
            debugPrint("isViewLoaded:\(isViewLoaded)")
        }
        
    }
    
    
    private func relationShipProperty()  {
        //获取navigation Controller
        if let navigationController = navigationController {
            debugPrint(navigationController)
        }
        //获取tabbar controller
        if let tabBarController = tabBarController {
            debugPrint(tabBarController)
        }
        //获取splitViewController 
        if let splitViewController = splitViewController {
            debugPrint(splitViewController)
        }
        
        //获取parentController 
        if let parentController = parent {
            debugPrint("parent:\(parentController)")
        }
        
        //获取presented controller,被当前控制器present的控制器
        if let presentedController = presentedViewController {
            debugPrint("presentedController:\(presentedController)")
        }
        
        //获取presenting view controller,将当前控制器present的控制器
        if let presentingViewController = presentingViewController {
            debugPrint("presentingViewController:\(presentingViewController)")
        }
        
        //判断是否被dismissed,presented,movintToParent,movingFromParent
        if isBeingDismissed {
            debugPrint(isBeingDismissed)
        }
        if isBeingPresented {
            debugPrint(isBeingPresented)
        }
        
        if isMovingToParentViewController {
            debugPrint(isMovingToParentViewController)
  
        }
        if isMovingFromParentViewController {
            debugPrint(isMovingFromParentViewController)
        }
    }
}
