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
    private var launchedShortcutItem: UIApplicationShortcutItem?
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        print(launchOptions ?? "")
        var shouldPerformAdditionalDelegateHandling = true
        if let shortcutItem = launchOptions?[UIApplicationLaunchOptionsKey.shortcutItem] as? UIApplicationShortcutItem {
            launchedShortcutItem = shortcutItem
            shouldPerformAdditionalDelegateHandling = false
        }
        if let shortcutItems = application.shortcutItems, shortcutItems.isEmpty {
            addDynamicShortcutItems()
        }
    
        return shouldPerformAdditionalDelegateHandling
    }
    
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        guard let shortcut = launchedShortcutItem else { return }
        _ = handleShortcutItemAction(shortcut)
        launchedShortcutItem = nil
    }
    
    
    private func addDynamicShortcutItems() {
        let mailIcon = UIApplicationShortcutIcon(type: .mail)
        let mailShortcut = UIApplicationShortcutItem(type: UIMutableApplicationShortcutItem.Identifier.mail.type, localizedTitle: "邮件", localizedSubtitle: "发送邮件", icon: mailIcon, userInfo: nil)
        
//        let locationIcon = UIApplicationShortcutIcon(type: .location)
//        let locationShortcut = UIApplicationShortcutItem(type: UIApplicationShortcutItem.Identifier.location.type, localizedTitle: "位置", localizedSubtitle: "分享位置", icon: locationIcon, userInfo: ["test": "value2"])
//        UIApplication.shared.shortcutItems = [mailShortcut, locationShortcut]
        UIApplication.shared.shortcutItems = [mailShortcut]

    }
    
    func handleShortcutItemAction(_ shortcutItem: UIApplicationShortcutItem) -> Bool{
        var handled = false
        let type = shortcutItem.type
        if UIApplicationShortcutItem.Identifier(type: type) != nil {
            handled = true
            if let navigationViewController = self.window?.rootViewController as? UINavigationController {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                if let shorcutItemViewController = storyboard.instantiateViewController(withIdentifier: "shortcutItemViewController") as? ShortcutItemViewController {
                    shorcutItemViewController.shortcutItem = shortcutItem
                    navigationViewController.pushViewController(shorcutItemViewController, animated: true)
                }
            }
        }
        return handled
    }
    
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        let handled = handleShortcutItemAction(shortcutItem)
        completionHandler(handled)
    }
}

