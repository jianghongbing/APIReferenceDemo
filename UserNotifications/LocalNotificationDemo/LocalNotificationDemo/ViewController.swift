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
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            startRequestAuthentication()
        case 1:
            break;
        default:
            break
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
        guard authenticationStatus == .authorized else {
            UIAlertController.confirmAlert(withTitle: "通知已经被拒绝", message: "请到设置里面去开启通知", fromController: self)
            return
        }
        
        //6.通知内容的创建
        let notificationContent = UNMutableNotificationContent()
        //7.设置通知内容的标题
        notificationContent.title = "hehe"
        //8.设置通知内容的副标题
        notificationContent.subtitle = "haha"
        //9.设置打开通知时,进入应用的luanchImage
        notificationContent.launchImageName = ""
        
        //10.设置badge number
        notificationContent.badge = (UIApplication.shared.applicationIconBadgeNumber + 1) as NSNumber
        
//        let reqeust = UNNotificationRequest(identifier: "123", content: notificationContent, trigger: <#T##UNNotificationTrigger?#>)
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


