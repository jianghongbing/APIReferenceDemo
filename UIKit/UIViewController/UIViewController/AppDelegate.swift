//
//  AppDelegate.swift
//  UIViewController
//
//  Created by pantosoft on 2017/6/26.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    struct RestoreKey {
        static let nameKey = "name"
    }
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    //1.是否允许回复app之前保存的状态
    func application(_ application: UIApplication, shouldRestoreApplicationState coder: NSCoder) -> Bool {
        debugPrint(#function)
        return true
    }
    //2.是否允许保存app的状态
    func application(_ application: UIApplication, shouldSaveApplicationState coder: NSCoder) -> Bool {
        debugPrint(#function)
        return true
    }
    //3.当在需要保存状态的那个controller的界面,进入后台时,会调用该方法进行保存当前app的状态,用于后面的恢复使用,可以在这里存储app当前状态的相关信息
    func application(_ application: UIApplication, willEncodeRestorableStateWith coder: NSCoder) {
        debugPrint(#function)
        coder.encodeConditionalObject("com.xxx.yyy", forKey: RestoreKey.nameKey)
    }
    
    //4.已经恢复之前保存的状态时,delegate会收到该消息,获取获取到之前保存的信息
    func application(_ application: UIApplication, didDecodeRestorableStateWith coder: NSCoder) {
        debugPrint(#function)
        UIApplication.shared.extendStateRestoration()
        let queue = DispatchQueue.main
        queue.async {
            UIApplication.shared.completeStateRestoration()
        }
        if let name = coder.decodeObject(forKey: RestoreKey.nameKey) {
            debugPrint("name:\(name)")
        }
    }
    

    

    

    
}

