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
        let viewAppearance = UIView.appearance()
        viewAppearance.tintColor = UIColor.green
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.barTintColor = .orange
        
        //2.获取在某个容器中的某个类的视图外观代理,设置后只对该容器类中的视图有效,在其他容器中的视图则没有效果
        let appearanceInNavigationBar = UIBarButtonItem.appearance(whenContainedInInstancesOf: [UINavigationBar.classForCoder() as! UIAppearanceContainer.Type])
        appearanceInNavigationBar.setTitleTextAttributes([NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18), NSAttributedStringKey.foregroundColor: UIColor.white], for: .normal)
    
        //3.某个视图的外观只在特定的环境下才有效,而在其他环境下则不生效
        let compactTraitCollection = UITraitCollection(horizontalSizeClass: .compact)
        let regularTraitCollection = UITraitCollection(horizontalSizeClass: .regular)
        let appearancInCompactTraitCollection = UINavigationBar.appearance(for: compactTraitCollection)
        appearancInCompactTraitCollection.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        let appearanceInRegularTraitCollection = UINavigationBar.appearance(for: regularTraitCollection);
        appearanceInRegularTraitCollection.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.red]
        //4.还可以更细粒度的设置,在某个容器类中和某个环境中同时满足才有效
        //同时满足在tabbar中和在compactTraitCollection的环境中,设置才会生效
//        let barItemAppearanceInTabbar = UIBarItem.appearance(for: compactTraitCollection, whenContainedInInstancesOf: [UITabBar.classForCoder() as! UIAppearanceContainer.Type])
        return true
    }
}

