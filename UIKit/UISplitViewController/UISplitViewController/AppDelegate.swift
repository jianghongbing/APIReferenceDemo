//
//  AppDelegate.swift
//  UISplitViewController
//
//  Created by pantosoft on 2017/6/13.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate{

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let splitViewController = UISplitViewController()
        //设置delegate
        splitViewController.delegate = self
        //是否允许通过手势来呈现出master controller的view.如果为true,可以通过滑动来显示和隐藏master controller的view,默认为true
        splitViewController.presentsWithGesture = true
        //设置偏好的显示模式
        splitViewController.preferredDisplayMode = .automatic
        //设置primaryColumn的显示比例
//        print("default primary column width fractioin:\(UISplitViewControllerAutomaticDimension)")
        
//        splitViewController.preferredPrimaryColumnWidthFraction = 0.3
        //设置主column的最小宽度
//        splitViewController.minimumPrimaryColumnWidth = 800
        //设置主column的最大宽度
        
//        splitViewController.isCollapsed 判断UISplitViewController是否collapsed(只显示一个控制器的view)
        
        splitViewController.maximumPrimaryColumnWidth = 400
        
        let masterViewController = MasterViewController()
        let masterNavigationController = UINavigationController(rootViewController: masterViewController)

        let detailViewController = DetailViewController()
        let detailNavigationController = UINavigationController(rootViewController: detailViewController)
        splitViewController.viewControllers = [masterNavigationController, detailNavigationController]
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = splitViewController
        window?.makeKeyAndVisible()
        return true
    }
}

// #MARK UISpliteViewControllerDelegate
extension AppDelegate: UISplitViewControllerDelegate {
    //1. splite view controller 的display mode 发生改变时,delegate会收到此消息
    func splitViewController(_ svc: UISplitViewController, willChangeTo displayMode: UISplitViewControllerDisplayMode) {
        print(#function, displayMode.rawValue)
    }
    
    //2. 当收到用户的操作时,可以选择合适的displayMode去更新
    func targetDisplayModeForAction(in svc: UISplitViewController) -> UISplitViewControllerDisplayMode {
        print(#function)
        return .automatic
    }
    
    //3. 当spliteViewController收到showViewController: sender:的消息时,delegate会收到下面的消息,如果返回true,需要在下面的方法中手动处理vc呈现的逻辑的逻辑,flase则使用spliteViewController showViewController的方法
    func splitViewController(_ splitViewController: UISplitViewController, show vc: UIViewController, sender: Any?) -> Bool {
        print("show vc:\(vc)")
        splitViewController.present(vc, animated: true, completion: nil)
        return true;
    }
    
    //4. 当spliteViewController收到showDetailViewController: sender:消息,delegate会收到下方的消息,如果返回true,需要在下面的方法中手动处理vc呈现的逻辑,flase则使用spliteViewController showDetailViewController的方法

    func splitViewController(_ splitViewController: UISplitViewController, showDetail vc: UIViewController, sender: Any?) -> Bool {
        print("show detail:\(vc)");
        return false
    }
    

    
    //5. spliteViewController 支持的方向
    func splitViewControllerSupportedInterfaceOrientations(_ splitViewController: UISplitViewController) -> UIInterfaceOrientationMask {
        return [.portrait, .landscapeLeft]
    }
    //6. 设置偏好的呈现的方向
    func splitViewControllerPreferredInterfaceOrientationForPresentation(_ splitViewController: UISplitViewController) -> UIInterfaceOrientation {
        return .portrait;
    }
    
    //7. 当屏幕的方向发生旋转时,从regular的状态到compact的状态时(屏幕上只会呈现一个控制器的视图),会触发该方法.返回的controller会作为新的primaryViewController出现在屏幕上
    func primaryViewController(forCollapsing splitViewController: UISplitViewController) -> UIViewController? {
        print(#function)
        let primaryViewController = UIViewController()
        primaryViewController.view.backgroundColor = UIColor.red
        return primaryViewController
    }
    //8. 当屏幕的方向发生旋转时,从compact的状态到regular的状态(屏幕上回呈现2个控制器的视图),会触发该方法.返回的controller会呈现在屏幕的右侧
    func primaryViewController(forExpanding splitViewController: UISplitViewController) -> UIViewController? {
        let masterViewController = MasterViewController()
        let masterNavigationController = UINavigationController(rootViewController: masterViewController)
        return masterNavigationController
    }
    
    //9. 当屏幕的方向发生旋转时,从regular的状态到compact的状态时(屏幕上只会呈现一个控制器的视图),会触发该方法.返回false,这使用默认的特性,这是屏幕会呈现之前在regular状态下的右边的视图内容,如果为true,这显示之前在regular状态下的左边的视图的内容
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        print(#function)
        return true
    }
    
    //10. 当屏幕的方向发生旋转时,从compact的状态到regular的状态(屏幕上回呈现2个控制器的视图),会触发该方法,而返回的控制器视图的内容则出现在spliteView的右边,如果为nil或者没有实现该方法,右边会展示之前所呈现的内容
    func splitViewController(_ splitViewController: UISplitViewController, separateSecondaryFrom primaryViewController: UIViewController) -> UIViewController? {
        print(#function)
        let viewController = UIViewController()
        viewController.view.backgroundColor = UIColor.orange
        return viewController
    }
    
}
