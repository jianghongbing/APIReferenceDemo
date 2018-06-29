//
//  AppDelegate.swift
//  UIApplicationShortcutItem
//
//  Created by pantosoft on 2018/6/29.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        if let shortcutItems = application.shortcutItems, shortcutItems.isEmpty {
            
        }
    
        return true
    }
}

