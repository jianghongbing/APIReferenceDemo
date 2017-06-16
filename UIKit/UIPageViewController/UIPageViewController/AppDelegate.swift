//
//  AppDelegate.swift
//  UIPageViewController
//
//  Created by pantosoft on 2017/6/16.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    let viewControllers = [AppDelegate.createController(withBackgroundColor: .red, tag: 100),
                           AppDelegate.createController(withBackgroundColor: .blue,tag: 200),
                           AppDelegate.createController(withBackgroundColor: .yellow,tag: 300),
                           AppDelegate.createController(withBackgroundColor: .orange,tag: 400)]
    
    
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let options = [UIPageViewControllerOptionSpineLocationKey: UIPageViewControllerSpineLocation.max.rawValue, UIPageViewControllerOptionInterPageSpacingKey: 30]
        
        //1.pageViewController的初始化.transitionStyle:pageCurl翻页效果, scroll滚动效果, navigationOrientation:导航的方向,垂直和水平方向.options:当trasiontionStyle为scroll时,可以通过UIPageViewControllerOptionInterPageSpacingKey来设置两个控制器切换的时候之间的间隔,忽略UIPageViewControllerOptionSpineLocationKey的值,当pageCurl,可以通过UIPageViewControllerOptionSpineLocationKey来设置两个相邻位置的控制器的排列,当UIPageViewControllerOptionSpineLocationKey的value为min的时候,排列和普通排列一样,当为mid时,两个控制器各占一半的屏幕显示,setViewController必须设置为两个控制器,当为max时,翻页效果会直接从下一个显示控制器的尾部开始,和min的动画效果相反
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: options)
//        pageViewController.view.backgroundColor = .gray
        
        //2.设置pageViewController的delegate和dataSource
        pageViewController.delegate = self
        pageViewController.dataSource = self
        
        //3.设置pageViewController的viewControllers.一般情况下只需要设置一个控制器,当tansitionStyle为pageCurl并且spineLocation为mid的时候,需要设置两个控制器
        pageViewController.setViewControllers([viewControllers[0]], direction: .forward, animated: true) {
            if $0 {
                print("set view controllers finished")
            }
        };
        
        pageViewController.isDoubleSided = true
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = pageViewController
        window?.makeKeyAndVisible()
        return true
    }
    
    class func createController(withBackgroundColor backgroundColor: UIColor, tag: Int) -> UIViewController {
        let viewController = TestViewController(tag: tag)
        viewController.view.backgroundColor = backgroundColor
        return viewController
    }
}

extension AppDelegate: UIPageViewControllerDelegate {
    
    
    /// 在通过手势切换到其他的控制器delegate会收到该消息
    ///
    /// - Parameters:
    ///   - pageViewController: pageViewController
    ///   - pendingViewControllers: 将要切换到的控制器
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        print(#function, pendingViewControllers.count, pendingViewControllers)
        
        if let count = pageViewController.viewControllers?.count {
            print("count:\(count)")
        }
    }
    
    
    /// 已经通过手势切换到其他控制器或者取消切换到其他控制的时候,delegate会收到该消息
    ///
    /// - Parameters:
    ///   - pageViewController: pageViewController
    ///   - finished: 动画是否结束
    ///   - previousViewControllers: 之前显示的控制器
    ///   - completed: true,完成切换到其他控制器, false,取消切换到其他控制器
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        print(#function, finished, previousViewControllers, completed)
    }
    
    
    /// 设置pageViewController的控制器如何排列
    ///
    /// - Parameters:
    ///   - pageViewController: pageViewController
    ///   - orientation: 当前inter的方向
    /// - Returns: 控制器需要排列的效果
    func pageViewController(_ pageViewController: UIPageViewController, spineLocationFor orientation: UIInterfaceOrientation) -> UIPageViewControllerSpineLocation {
        print(#function)
        return .max
    }
    
    //4. 设置pageViewController支持旋转的方向
    func pageViewControllerSupportedInterfaceOrientations(_ pageViewController: UIPageViewController) -> UIInterfaceOrientationMask {
        return [.portrait, .landscapeLeft]
    }
    
    //5. 设置pageViewController呈现的时候偏爱的方向
    func pageViewControllerPreferredInterfaceOrientationForPresentation(_ pageViewController: UIPageViewController) -> UIInterfaceOrientation {
        return .portrait
    }
    

}

extension AppDelegate: UIPageViewControllerDataSource {
    
    /// 通过dataSource来设置往后面滑动要显示的控制器
    ///
    /// - Parameters:
    ///   - pageViewController: pageViewController
    ///   - viewController: 当前显示的控制器
    /// - Returns: 往后面滑动要显示的控制器
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        if let index = viewControllers.index(of: viewController) {
//            if index >= 0 && index < viewControllers.count - 1 {
//                return viewControllers[index + 1]
//            }
//        }
//        
//        return nil
        var next = 0
        if let index = viewControllers.index(of: viewController) {
            if index == viewControllers.count - 1 {
                next = 0
            } else {
                next = index + 1
            }
            
            return viewControllers[next]
        }
        return nil 
    }
    
    
    /// 通过dataSource来设置往前面滑动要显示的控制器
    ///
    /// - Parameters:
    ///   - pageViewController: pageViewController
    ///   - viewController: 当前显示的控制器
    /// - Returns: 往前面滑动要显示的控制器
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        if let index = viewControllers.index(of: viewController) {
//            if index <= viewControllers.count - 1 && index > 0 {
//                return viewControllers[index - 1]
//            }
//        }
//        return nil
        var before: Int = 0
        if let index = viewControllers.index(of: viewController) {
            if index == 0 {
                before = viewControllers.count - 1
            }else {
                before = index - 1
            }
            
            return viewControllers[before]
        }
        
        return nil
    }
    
    //下面两个方法必须同时实现,且pageViewController的transitionStyle为scroll,并且滚动的方向为水平的时候,才能显示出来
    //3. pageControl的page count
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return viewControllers.count
    }
    
    //4. 当前页的page index
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
