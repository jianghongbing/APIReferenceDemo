//
//  NotificationManager.swift
//  LocalNotificationDemo
//
//  Created by pantosoft on 2017/9/15.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit
import UserNotifications

//enum NotificationType {
//    
//}


enum NotificationCategoryType: String {
    case normal
    case input
    case customUI
}

enum InputNotificationActionType:String {
    case input
    case hello
    case none
}


class NotificationManager: NSObject, UNUserNotificationCenterDelegate{
    static let defaultManager = NotificationManager()
    private override init() {
        super.init()
        UNUserNotificationCenter.current().delegate = self
    }
    
    func registerCategory() {
        let inputCategory: UNNotificationCategory = {
            let inputAction = UNTextInputNotificationAction(identifier: InputNotificationActionType.input.rawValue, title: "Input", options: [.foreground], textInputButtonTitle: "send", textInputPlaceholder: "input text")
            let helloAction = UNNotificationAction(identifier: InputNotificationActionType.hello.rawValue, title: "hello", options: [.foreground])
            let cancelAction = UNNotificationAction(identifier: InputNotificationActionType.none.rawValue, title: "Cancel", options: [.destructive])
            let category = UNNotificationCategory(identifier: NotificationCategoryType.input.rawValue, actions: [inputAction, helloAction, cancelAction], intentIdentifiers: [], options: [.customDismissAction])
            return category
        }();
        
        UNUserNotificationCenter.current().setNotificationCategories([inputCategory])
    }
    
    func requestAuthentication() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                UIApplication.shared.registerForRemoteNotifications()
            }else {
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

extension NotificationManager {
    
}
