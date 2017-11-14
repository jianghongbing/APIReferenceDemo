//
//  TableViewController.swift
//  UIApplication
//
//  Created by pantosoft on 2017/11/13.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var backgroundTaskIdentifier: UIBackgroundTaskIdentifier = UIBackgroundTaskInvalid
    override func viewDidLoad() {
        super.viewDidLoad()
        //UIApplication:每个一个app有且仅有一个UIApplication实例,application的主要工作:处理触摸事件和对将事件转发给其他对象
        //1.获取UIAplication实例对象
        let application = UIApplication.shared
        //2.设置applicatonDelegate,系统会创建appDelegate类,并在UIApplicationMain方法中,将applicationDelegate class传进去,创建一个默认的AppDelegate实例作为UIApplication对象的delegate,来管理application生命周期等功能
//        application.delegate = self;
        //3.判断是否忽略交互事件
        let isIgnoringInteractionEvents = application.isIgnoringInteractionEvents
        print(isIgnoringInteractionEvents)
        //4.开始忽略交互事件
        application.beginIgnoringInteractionEvents()
        //5.结束忽略交互事件
        application.endIgnoringInteractionEvents()
        //6.是否不启用idleTimer,默认为false,启用idleTimer,当将app放在前台,不使用它,系统会启用idleTimer,当过了idleTimer的时间,手机会进入锁屏状态,如果为true,手机将不会锁屏,大多数应用应该设置为false,即使设置为true之后,在某个时间也要将其设置为false.
        let isIdleTimerDisabled = application.isIdleTimerDisabled
        print(isIdleTimerDisabled)
        //7.是否可以打开某个URL和打开某个URL
        if let url = URL(string: "https://www.apple.com"){
            if application.canOpenURL(url) {
                print("can open url:\(url)")
                //            application.openURL(url)
//                application.open(url, options: [:], completionHandler: nil)
            }
        }
        //8.将事件派发给合适的对象去处理
//        application.sendEvent(nil)
        //9.获取applicaton的keyWindow和所有的windows
        //9.1keyWindow:最后一个发送makeKeyAndVisialble或者makeKeyWindow消息的window
        if let keyWindow = application.keyWindow {
            print("keyWindow:\(keyWindow)")
        }
        let windows = application.windows
        print("windows:\(windows)", windows)
        //10.从某一个对象发送action到另外一个对象
        let isHandleAction = application.sendAction(#selector(sendActionTest), to: self, from: nil, for: nil)
        print(isHandleAction)
        //11.设置网络指示器是否可见
        application.isNetworkActivityIndicatorVisible = true
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5.0) {
            application.isNetworkActivityIndicatorVisible = false
        }
        //12.获取statusBar的样式,是否隐藏,statusBar的方向
        let statusBarStyle = application.statusBarStyle
        let isStatusBarHidden = application.isStatusBarHidden
        let statusBarOrientation = application.statusBarOrientation
        print("statusBarStyle:\(statusBarStyle.rawValue),isStatusBarHidden:\(isStatusBarHidden),statusBarOrientation:\(statusBarOrientation.rawValue)")
        let windowSupportOrientation = application.supportedInterfaceOrientations(for: application.keyWindow)
        print("windowSupportOrientation:\(windowSupportOrientation)")
        //13.获取屏幕旋转时statusBar animation的duration(90度的旋转),如果为180则乘2
        let statusBarAnimationDuration = application.statusBarOrientationAnimationDuration
        //14.获取statusBar的frame
        let statusBarFrame = application.statusBarFrame
        print("animation duration:\(statusBarAnimationDuration),statusBarFrame:\(statusBarFrame)")
        //15.设置和获取application badge number,在iOS8之后,必须先注册通知设置,如果没有设置,badge number不会生效,一直处于隐藏状态
        application.applicationIconBadgeNumber = 10
        //16.是否支持手机晃动的时候进行编辑,默认是true.同时需要实现canBecomeFirstResponder并且返回true
        application.applicationSupportsShakeToEdit = true
        //17.获取UIApplication的state
        let applicationState = application.applicationState
        print("applicationState:\(applicationState.rawValue)")
        //18.获取app在后台运行的时间
        let backgroundTimeRemaining = application.backgroundTimeRemaining
        print("backgroundTimeRemaing:\(backgroundTimeRemaining)")
        //19.开始后台任务
        DispatchQueue.main.async {
//            for i in 0 ..< 1000000 {
//                print("i=\(i)")
//            }
        }
//        backgroundTaskIdentifier = application.beginBackgroundTask(withName: "com.jianghongbing.backgroundTaskIdentifier", expirationHandler: {
//
//        })
        backgroundTaskIdentifier = application.beginBackgroundTask {
            [unowned self] in
            print("backgroundTaskCompleted")
            application.endBackgroundTask(self.backgroundTaskIdentifier)
            self.backgroundTaskIdentifier = UIBackgroundTaskInvalid
//           let _ = application.endBackgroundTask(backgroundTaskIdentifier)
        }
        print("backgroundTaskIdentifier:\(backgroundTaskIdentifier)")
        //20.手动调用结束后台任务
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3.0) {
//            application.endBackgroundTask(self.backgroundTaskIdentifier)
//        }
        //21.设置程序定期获取数据的最小时间间隔,只有在backgroundMode开启的时候才生效
        application.setMinimumBackgroundFetchInterval(UIApplicationBackgroundFetchIntervalMinimum)
        //22.检测后台刷新数据的能力,如(app在后台更新用户的位置等)
        let backgroundRefreshStatus = application.backgroundRefreshStatus
        print("backgroundRefreshStatus:\(backgroundRefreshStatus)")
        //23.内容保护是否开启
        let isProtectedDataAvailable = application.isProtectedDataAvailable;
        print("isRrotectedDataAvailable:\(isProtectedDataAvailable)")
        //24.获取用户界面布局方向和偏好内容字体大小类别
        let userInterfaceLayoutDirection = application.userInterfaceLayoutDirection
        let preferredContentSizeCategory = application.preferredContentSizeCategory
        print(userInterfaceLayoutDirection.rawValue, preferredContentSizeCategory.rawValue)
        //24.notifiation相关
//        //24.1是否注册远程通知(必须在app开始远程通知的功能)
//        let isRegisterNotification = application.isRegisteredForRemoteNotifications
//        //24.1注册远程通知
//        application.registerForRemoteNotifications()
//        //24.2取消注册远程通知
//        application.unregisterForRemoteNotifications()
        //25.开始接受和结束接受远程控制事件
//        application.beginReceivingRemoteControlEvents()
//        application.endReceivingRemoteControlEvents()
        //26.设置app图标上面的3Dtouch功能
//        application.shortcutItems = nil
        //27.动态更换app图标
//        let supportsAlternateIcons = application.supportsAlternateIcons
//        let appIconName = application.alternateIconName
//        application.setAlternateIconName("") {
//            if let error = $0 {
//                print("error:\(error)")
//            }else {
//                print("change icon success")
//            }
//        }
        //28.app状态恢复
//        application.extendStateRestoration()
//        application.completeStateRestoration()
//        application.ignoreSnapshotOnNextApplicationLaunch()
//        UIApplication.registerObject(forStateRestoration: <#T##UIStateRestoring#>, restorationIdentifier: <#T##String#>)
        
        
    }
    
    
    @objc private func sendActionTest() {
        print("sendActionTest")
    }
    
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            print("检测到设备晃动")
        }
    }
    
    
    @IBAction func changeAppIcon(_ sender: Any) {
        let application = UIApplication.shared
        let supportsAlternateIcons = application.supportsAlternateIcons
        var iconName = "cat"
        if let appIconName = application.alternateIconName {
            print("alternaterIconName:\(appIconName)")
            iconName = appIconName == "cat" ? "catOne" : "cat";
        }
        if supportsAlternateIcons {
            application.setAlternateIconName(iconName) {
                if let error = $0 {
                    print("error:\(error)")
                }else {
                    print("change icon success")
                }
            }
        }
    }
    
    @IBAction func resetAppIcon(_ sender: Any) {
        let application = UIApplication.shared
        let supportsAlternateIcons = application.supportsAlternateIcons
        if supportsAlternateIcons {
            if let _ = application.alternateIconName {
                application.setAlternateIconName(nil, completionHandler: {
                    if let error = $0 {
                        print("error:\(error)")
                    }else {
                        print("change icon success")
                    }
                })
            }
        }
    }
}




extension TableViewController: UIApplicationDelegate {
    
}
