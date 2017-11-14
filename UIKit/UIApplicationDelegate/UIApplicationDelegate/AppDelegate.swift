//
//  AppDelegate.swift
//  UIApplicationDelegate
//
//  Created by pantosoft on 2017/11/14.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var sequence = 0
    //1.application launching
    //1.1 application 完成加载的时候调用,apple不建议实现该方法,用didFinishLaunchingWithOptions代替
//    func applicationDidFinishLaunching(_ application: UIApplication) {
//        sequence += 1
//        print("\(sequence):\(#function)")
//    }
    
    //1.2 application已经完成加载(比如storyboard和nib文件等已经加载完成),但是state restoration还没有开始
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        sequence += 1
        print("\(sequence):\(#function)")
        return true
    }
    //1.3 appilcation已经加载完成,准备运行,在state restoration完成之后,在window和UI被呈现出来之前调用,对于app的相关初始化工作,apple建议在willFinishiLaunchingOptions方法里面完成.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        sequence += 1
        //一般情况下,launchOptions为空置,如果通过3Dtouch或者openURL的方式来打开app等,launchOptions会有相应的值在里面
        if let options = launchOptions {
            for (key,value) in options {
                print("\(key):\(value)")
            }
        }
        print("\(sequence):\(#function)")
        return true
    }
    //2. application life circle
    /**
     程序的声明周期:在app没有运行(not running)的时候,用户点击或者通过通知,open url,3DTouch等其他方式打开app,在app加载完成之后,app会进入到前台(foreground)模式,进入短暂的不活跃(inactive)状态,然后进入活跃(active)状态,当用按home键或者打开其他app,app又会进入不活跃状态(inactive),进而进入后台(background)模式,让后app会被挂起(suspended)暂停状态,此时app在后台可可能还会执行任务(background task),如果用户杀死了app,app会被终止(Terminate)状态,app进入没有运行(not runing)的状态.如果用户此时点击appt图标,此时app不会在进入app launch,app会进入到前台(foreground)模式,进入短暂的不活跃(inactive)状态,然后进入活跃(active)状态,如此循环
     */
    //2.1在app进入活动状态的时候调用(如用户点击app图标,进入app或者app从后台回到前台的时候等)
    func applicationDidBecomeActive(_ application: UIApplication) {
        sequence += 1
        print("\(sequence):\(#function)")
    }
    
    //2.2在app进入不活动状态的时候调用(如按住home键会桌面的时候,或者双击home将进入多任务的时候,电话来的时候等)
    func applicationWillResignActive(_ application: UIApplication) {
        sequence += 1
        print("\(sequence):\(#function)")
    }
    //2.3在app进入后台的时候调用
    func applicationDidEnterBackground(_ application: UIApplication) {
        sequence += 1
        print("\(sequence):\(#function)")
    }
    //2.4在app进入前台的时候调用
    func applicationWillEnterForeground(_ application: UIApplication) {
        sequence += 1
        print("\(sequence):\(#function)")
    }
    //2.5app将要终止的时候调用(如用户杀掉了app)
    func applicationWillTerminate(_ application: UIApplication) {
        sequence += 1
        print("\(sequence):\(#function)")
        sequence = 0
    }
    //3.System event:系统相关事件
    //3.1发生内存警告的时候,会调用
    func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        sequence += 1
        print("\(sequence):\(#function)")
    }
    
    //3.2受保护的内容变为可以访问的时候调用,通过NSFileManager来设置文件访问的安全权限
    func applicationProtectedDataDidBecomeAvailable(_ application: UIApplication) {
    }
    //3.3受保护的内容变为不能访问的时候调用
    func applicationProtectedDataWillBecomeUnavailable(_ application: UIApplication) {
    }
    //3.4重要的时间发生改变的时候(如午夜的来临)调用,没怎么用过
    func applicationSignificantTimeChange(_ application: UIApplication) {
    }
    //4.application state save && restoration
    func application(_ application: UIApplication, shouldSaveApplicationState coder: NSCoder) -> Bool {
        return true
    }
    func application(_ application: UIApplication, shouldRestoreApplicationState coder: NSCoder) -> Bool {
        return true
    }
    func application(_ application: UIApplication, viewControllerWithRestorationIdentifierPath identifierComponents: [Any], coder: NSCoder) -> UIViewController? {
        return nil
    }
    
    func application(_ application: UIApplication, willEncodeRestorableStateWith coder: NSCoder) {
        
    }
    
    func application(_ application: UIApplication, didDecodeRestorableStateWith coder: NSCoder) {
        
    }
    
    


}

