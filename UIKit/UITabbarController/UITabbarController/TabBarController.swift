//
//  TabBarController.swift
//  UITabbarController
//
//  Created by pantosoft on 2017/6/28.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //1.设置viewControllers
        setupChildViewControllers()
        //2.设置选中的位置
        selectedIndex = 2
        //3.设置delegate
        delegate = self
    }
    
    private func setupChildViewControllers() {
        var childViewControllers:[UINavigationController] = []
        for i in 1 ..< 10 {
            let navigationController = createChildViewController(title: String(i), tabBarSystemItemType: UITabBarSystemItem.init(rawValue: i)!, tag: i)
            childViewControllers.append(navigationController)
        }
        
        setViewControllers(childViewControllers, animated: true)
    }
    
    private func createChildViewController(title: String, tabBarSystemItemType: UITabBarSystemItem, tag: Int) -> UINavigationController {
        let viewController = UIViewController()
        viewController.view.backgroundColor = UIColor(colorLiteralRed: Float(arc4random_uniform(255)) / 255.0, green: Float(arc4random_uniform(255)) / 255.0, blue: Float(arc4random_uniform(255)) / 255.0, alpha: 1.0)
        viewController.title = title
        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: tabBarSystemItemType, tag: tag)
        return UINavigationController(rootViewController: viewController)
    }
}

extension TabBarController: UITabBarControllerDelegate {
    //1.是否允许viewControlle被选中
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
    //2.viewController被选中的时候,delegate会收到该消息
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        debugPrint(selectedIndex)
        debugPrint(#function)
        debugPrint("moreNavigationController:\(moreNavigationController)")
        if let customizable = customizableViewControllers {
            debugPrint("customizable:\(customizable)")
        }
    }
    
    //3.将要custom tabBarController显示的controlle时,delegat会收到该消息
    func tabBarController(_ tabBarController: UITabBarController, willBeginCustomizing viewControllers: [UIViewController]) {
        debugPrint(#function)

    }
    
    //4.将要结束自定义controllers时,delegate会收到该消息, changed:表示是否修改之前显示的controller
    func tabBarController(_ tabBarController: UITabBarController, willEndCustomizing viewControllers: [UIViewController], changed: Bool) {
        
        debugPrint(#function)
        print(viewControllers, changed)

    }
    
    //5.结束自定义controllers时,delegate会收到该消息
    func tabBarController(_ tabBarController: UITabBarController, didEndCustomizing viewControllers: [UIViewController], changed: Bool) {
        
        debugPrint(#function)

    }
    
    //6.设置tabBarControlle的界面支持的方向
    func tabBarControllerSupportedInterfaceOrientations(_ tabBarController: UITabBarController) -> UIInterfaceOrientationMask {
        return .all
    }
    
    //7.当呈现tabBarController,偏好界面显示方向
    func tabBarControllerPreferredInterfaceOrientationForPresentation(_ tabBarController: UITabBarController) -> UIInterfaceOrientation {
        return .portrait
    }
    
    //8.自定义动画时,可以依据返回的对象,来做对应的动画
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
    
    //9.需要自定义交互动画时,依据返回的对象,做对应的交互动画
    func tabBarController(_ tabBarController: UITabBarController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }
}
