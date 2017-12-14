//
//  AppDelegate.swift
//  UIAppearance
//
//  Created by pantosoft on 2017/12/14.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //UIAppearance:视图外观代理,用于统一设置视图的外观.必须在视图进入window之前设置,如果视图已经在window中,再通过UIAppearance来设置,它不会改变已经在window上的视图的外观
        //1.获取某个类的外观代理
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.barTintColor = .orange
        
        //2.获取在
        let barButtonItemAppearance = UIBarButtonItem.appearance(whenContainedInInstancesOf: [UIToolbar.classForCoder() as! UIAppearanceContainer.Type])
//        barButtonItemAppearance.setTitleTextAttributes(<#T##attributes: [NSAttributedStringKey : Any]?##[NSAttributedStringKey : Any]?#>, for: <#T##UIControlState#>)
        
        return true
    }
}

