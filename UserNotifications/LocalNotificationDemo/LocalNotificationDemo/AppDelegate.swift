//
//  AppDelegate.swift
//  LocalNotificationDemo
//
//  Created by pantosoft on 2017/9/7.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit
import UserNotifications
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let notificationCenter = UNUserNotificationCenter.current()
//        notificationCenter.delegate =
        return true
    }
}

