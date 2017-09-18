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
    //#MARK: UNUserNotificationCenterDelegate
    
    //1.将要呈现通知的时候,会调用该方法,可以通过completionHandler回调来设置该通知显示为alert,是否播放声音,是否显示badgeNumber
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("will present notification")
        completionHandler([.alert, .sound, .badge])
    }
    
    //2.当点击了通知,或者通过的action方式进入app,delegate会收到该消息,可以在这个方法里面来处理点击通知的逻辑
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("did receive notification:\(response)")
        completionHandler()
    }
}
