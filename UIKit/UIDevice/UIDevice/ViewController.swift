//
//  ViewController.swift
//  UIDevice
//
//  Created by pantosoft on 2017/6/21.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange
        //1. 获取当前设备
        let device = UIDevice.current
        //2. 获取设备名称 如 my iPhone
        let name = device.name
        //3. 获取设备类型名称. 如 iPhone, iPod touch等
        let model = device.model
        //4. 获取设备在本地的类型名称
        let localizeModel = device.localizedModel
        //5. 获取系统名称 如 iOS,OSX
        let systemName = device.systemName
        //6. 获取当前设备系统版本 如8.3.1
        let systemVersion = device.systemVersion
        debugPrint(name, model, localizeModel, systemName, systemVersion)
        
        //7. 获取设备上的id
        let identifier = device.identifierForVendor
        if let identifier = identifier {
            debugPrint("identifier:\(identifier)")
        }
        
        //8.  是否开启电池状态监控,默认为false,当电池状态发生改变时,不会发送电池状态改变的通知,true,则在电池状态发生改变时,会发送通知
        device.isBatteryMonitoringEnabled = true
        //9. 获取电池level
        let batteryLevel = device.batteryLevel
        //10. 获取当前电池的状态
        let batteryState = device.batteryState
        debugPrint(batteryLevel, batteryState.rawValue)
        //11. 是否开启proximity监控(需要设备支持),开启后,当proximity状态发生改变时,会发送对应的通知
        device.isProximityMonitoringEnabled = true
        //12. 获取proximity的state
        let proximityState = device.proximityState
        debugPrint(proximityState)
        
        //13. 判断设备是否支持多线程
        let isMultitaskingSupported = device.isMultitaskingSupported
        
        //14.判断当前设备的ui style
        let userInterfaceIdiom = device.userInterfaceIdiom
        debugPrint(isMultitaskingSupported, userInterfaceIdiom.rawValue)
        
        //15.监听相关的通知信息
//        public static let UIDeviceOrientationDidChange: NSNotification.Name
//        
//        @available(iOS 3.0, *)
//        public static let UIDeviceBatteryStateDidChange: NSNotification.Name
//        
//        @available(iOS 3.0, *)
//        public static let UIDeviceBatteryLevelDidChange: NSNotification.Name
//        
//        @available(iOS 3.0, *)
//        public static let UIDeviceProximityStateDidChange: NSNotification.Name
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(deviceOrientationDidChanged(_:)), name: .UIDeviceOrientationDidChange, object: nil)
        notificationCenter.addObserver(self, selector: #selector(deviceProximityStateDidChanged(_:)), name: .UIDeviceProximityStateDidChange, object: nil)
        notificationCenter.addObserver(self, selector: #selector(deviceBatteryLevelDidChanged(_:)), name: .UIDeviceBatteryLevelDidChange, object: nil)
        notificationCenter.addObserver(self, selector: #selector(deviceBatteryStateDidChanged(_:)), name: .UIDeviceBatteryStateDidChange, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func deviceOrientationDidChanged(_ notification: Notification) {
        //16. 获取设备的方向
        let orientation = UIDevice.current.orientation
        //17. 判断设备是否为水平方向
        let isLandscape = UIDeviceOrientationIsLandscape(orientation)
        //18. 判断设备是否为垂直方向
        let isPortrait = UIDeviceOrientationIsPortrait(orientation)
        //19. 判断是不是设备所支持的方向
        let isValidOrientation = UIDeviceOrientationIsValidInterfaceOrientation(orientation)
        debugPrint(orientation.rawValue, isLandscape, isPortrait, isValidOrientation)
        
        debugPrint(orientation.isPortrait, orientation.isLandscape, orientation.isFlat, orientation.isValidInterfaceOrientation)
    }
    
    @objc private func deviceProximityStateDidChanged(_ notification: Notification) {
        let proximityState = UIDevice.current.proximityState
        debugPrint("proximityState:\(proximityState)")
    }
    
    @objc private func deviceBatteryLevelDidChanged(_ notification: Notification) {
        let batteryLevel = UIDevice.current.batteryLevel
        debugPrint("batteryLevel:\(batteryLevel)")
    }
    
    @objc private func deviceBatteryStateDidChanged(_ notification: Notification) {
        let batteryState = UIDevice.current.batteryState
        debugPrint("batteryState:\(batteryState.rawValue)")
    }
    
    
}

