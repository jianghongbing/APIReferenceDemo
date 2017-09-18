//
//  ViewController.swift
//  LocalNotificationDemo
//
//  Created by pantosoft on 2017/9/7.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit
import UserNotifications
class ViewController: UITableViewController {
    var authenticationStatus: UNAuthorizationStatus = .notDetermined
    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().getNotificationSettings {
            self.authenticationStatus = $0.authorizationStatus
        }
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            startRequestAuthentication()
        }else {
            if authenticationStatus != .authorized {
                UIAlertController.confirmAlert(withTitle: "请先请求用户允许发送通知", message: "发送通知前,必须让用户允许发送通知", fromController: self)
                return
            }
            
            if indexPath.row == 1 {
                sendNormalNotification()
            }else if indexPath.row == 2 {
                sendNotificationWithActions()
            }else if indexPath.row == 3 {
                
            }
        }
        

    }
    
    
    private func startRequestAuthentication() {
        //1.获取当前notification的相关的授权状态
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            self.authenticationStatus = settings.authorizationStatus
            switch settings.authorizationStatus {
            //2.通知授权状态还没有确认
            case .notDetermined:
                //3.向用户发起请求,是否开启通知
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: { (granted, error) in
                    if granted  {
                        self.startRequestAuthentication()
                    }else {
                        if let error = error {
                            print(error.localizedDescription)
                        }
                    }
                })
            //4.用户已经拒绝接受通知
            case .denied:
                UIAlertController.confirmAlert(withTitle: "通知已经被拒绝", message: "请到设置里面去开启通知", fromController: self)
            //5.用户已经开启通知
            case .authorized:
                UIAlertController.confirmAlert(withTitle: "通知已经被允许", message: "可以开始发通知", fromController: self)
            }
        }
    }
    
    
    private func sendNormalNotification() {
        /**
        guard authenticationStatus == .authorized else {
            UIAlertController.confirmAlert(withTitle: "通知已经被拒绝", message: "请到设置里面去开启通知", fromController: self)
            return
        } 
         */
        //6.通知内容的创建
        let notificationContent = UNMutableNotificationContent()
        //7.设置通知内容的标题
        notificationContent.title = "notification title"
        //8.设置通知内容的副标题
        notificationContent.subtitle = "notification subtitle"
        //9.设置打开通知时,进入应用的luanchImage
        //notificationContent.launchImageName = ""
        //
        //9.设置通知body
        notificationContent.body = "push notification by UNUserNotification"
        //10.设置badge number
        notificationContent.badge = (UIApplication.shared.applicationIconBadgeNumber + 1) as NSNumber
        
        //11.定时通知,timeInterval:多少秒后发送, repeats:是否重复
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        
        //12.创建notification request
        let reqeust = UNNotificationRequest(identifier: "jianghongbing", content: notificationContent, trigger:trigger)
        //13.发送通知
        UNUserNotificationCenter.current().add(reqeust) {
            if let error = $0 {
                print("error:\(error.localizedDescription)")
            }else {
                print("send notification success")
            }
        }
    }
    
    
    private func sendNotificationWithActions() {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "action notification"
        notificationContent.subtitle = "notification with actions "
        notificationContent.body = "push notification by UNUserNotification"
        //14.设置通知到来的时候声音
        notificationContent.sound = UNNotificationSound.default()
        notificationContent.categoryIdentifier = NotificationCategoryType.input.rawValue
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        let reqeust = UNNotificationRequest(identifier: "jianghongbing", content: notificationContent, trigger:trigger)
        UNUserNotificationCenter.current().add(reqeust) {
            if let error = $0 {
                print("error:\(error.localizedDescription)")
            }else {
                print("send notification success")
            }
        }
    }
}


extension UIAlertController {
    static func confirmAlert(withTitle title: String, message: String, fromController: UIViewController) {
        let action = UIAlertAction(title: "Done", style: .default, handler: nil)
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(action)
        fromController.present(alertController, animated: true, completion: nil)
    }
}


