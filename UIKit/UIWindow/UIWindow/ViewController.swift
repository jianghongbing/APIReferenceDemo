//
//  ViewController.swift
//  UIWindow
//
//  Created by pantosoft on 2017/6/22.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var testWindow: UIWindow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        //        var window = UIApplication.shared.keyWindow
        //        debugPrint(window ?? "")
        //        window = view.window
        //        debugPrint(window ?? "")
        //        //
        //        let windows =  UIApplication.shared.windows
        //        debugPrint(windows)
        //
        //        windows.forEach {
        //            debugPrint($0.isKeyWindow)
        //        }
        
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("create new window", for: .normal)
        button.addTarget(self, action: #selector(createNewWindow(_:)), for: .touchUpInside)
        view.addSubview(button)
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        registerNotifications()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func registerNotifications() {
        let notificationCenter = NotificationCenter.default
        
        //window 通知
        notificationCenter.addObserver(self, selector: #selector(windowDidBecomeVisible(_:)), name: .UIWindowDidBecomeVisible, object: nil)
        notificationCenter.addObserver(self, selector: #selector(windowDidBecomeKey(_:)) , name: .UIWindowDidBecomeKey, object: nil)
        notificationCenter.addObserver(self, selector: #selector(windowDidResignKey(_:)), name: .UIWindowDidResignKey, object: nil)
        
        notificationCenter.addObserver(self, selector: #selector(windowDidBecomeHidden(_:)), name: .UIWindowDidBecomeHidden, object: nil)
        // 键盘通知
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardDidShow(_:)), name: .UIKeyboardDidShow, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHidden(_:)), name: .UIKeyboardWillHide, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardDidHidden(_:)), name: .UIKeyboardDidHide, object: nil)
        
        notificationCenter.addObserver(self, selector: #selector(keyboardWillChangeFrame(_:)), name: .UIKeyboardWillChangeFrame, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardDidChangeFrame(_:)), name: .UIKeyboardDidChangeFrame, object: nil)
    }
    
    //1. window显示的时候,会收到该通知
    @objc private func windowDidBecomeVisible(_ notification: Notification) {
        if let object = notification.object {
            debugPrint(#function, object)
        }
    }
    
    //2. window成为keywindow的时候,会收到该通知
    @objc private func windowDidBecomeKey(_ notification: Notification) {
        if let object = notification.object {
            debugPrint(#function, object)
        }
    }
    
    //3. window由key window变为非key window的时候,会收到该通知
    @objc private func windowDidResignKey(_ notification: Notification) {
        if let object = notification.object {
            debugPrint(#function, object)
        }
    }
    
    //4. 隐藏window的时候,会收到该通知
    @objc private func windowDidBecomeHidden(_ notification: Notification) {
        if let object = notification.object {
            debugPrint(#function, object)
        }
    }
    
    //5.键盘将要显示的时候会受到该通知
    @objc private func keyboardWillShow(_ notification: Notification) {
        if let userInfo = notification.userInfo {
            debugPrint(#function, userInfo)
        }
    
    }
    //6.键盘已经显示的时候会收到该通知
    @objc private func keyboardDidShow(_ notification: Notification) {
        if let userInfo = notification.userInfo {
            debugPrint(#function, userInfo)
        }
    }
    //7.键盘将要隐藏的时候,会收到该通知
    @objc private func keyboardWillHidden(_ notification: Notification) {
        if let userInfo = notification.userInfo {
            debugPrint(#function, userInfo)
        }
    }
    
    //8. 键盘已经隐藏的时候,会收到该通知
    @objc private func keyboardDidHidden(_ notification: Notification) {
        if let userInfo = notification.userInfo {
            debugPrint(#function, userInfo)
        }
    }
    //9. 键盘的frame将要发生改变的时候,会收到该通知
    @objc private func keyboardWillChangeFrame(_ notification: Notification) {
        if let userInfo = notification.userInfo {
            debugPrint(#function, userInfo)
        }
    }
    
    //10.键盘的frame已经发生改变的时候,会收到该通知
    @objc private func keyboardDidChangeFrame(_ notification: Notification) {
        if let userInfo = notification.userInfo {
            debugPrint(#function, userInfo)
        }
    }
    
    
    @objc func createNewWindow (_ button: UIButton) {
        let window = UIWindow(frame: CGRect(x: 200, y: 0, width: 100, height: 200))
        self.testWindow = window
        let rootViewController = TestViewController()
        //设置rootViewController
        window.rootViewController = rootViewController
        //设置windowLevel级别,当我alert或者statusBar级别时,winwow会遮盖statusbar
        window.windowLevel = UIWindowLevelNormal
        window.isHidden = false 
        //将该window作为key window,并且显示出来
//        window.makeKeyAndVisible()
    }
    
    @IBAction func logInfo(_ sender: Any) {
        //1.获取keywindow, 一个app只有一个keywindow,也就是最近一个window调用makeKeyAndVisible,一般不要在viewdidload中去获取这个window,有可能为nil
        if let window = UIApplication.shared.keyWindow {
            debugPrint(window, window.isKeyWindow)
        }
        
        //2. 获取view的window,不要在viewDidLoad中获取view的window,有可能view还没有添加到window上去.
        if let viewWindow = view.window {
            debugPrint(viewWindow, viewWindow.isKeyWindow)
        }
        //3.获取所有的window. 当用UIStoryboard作为程序的入口时,默认会自动给你创建一个window,并且makeKeyAndVisiable,如果再在app delegate中创建一个window并且makeKeyAndVisiable那么此时,就有两个window
        //4.弹出键盘后,多出了两个window.UITextEffectsWindow和UIRemoteKeyboardWindow,退出键盘后,UIRemotekeyboardWindow对被回收,而后面UITextEffectsWindow一直存在(不知道是啥原因)
        let windows =  UIApplication.shared.windows
        windows.forEach {
            debugPrint($0,$0.isKeyWindow, $0.isHidden)
        }
        
        //5. window之间的point和rect转换
        if let testWindow = self.testWindow, let viewWindow = view.window {
            let point = CGPoint(x: 100.0, y: 100.0)
            //5.1 将window上的point转换在另外一个window为坐标系的位置
            var convertPoint = viewWindow.convert(point, to: testWindow)
            debugPrint("convertPoint:\(convertPoint)")
            convertPoint = testWindow.convert(point, to: viewWindow)
            debugPrint("convertPoint:\(convertPoint)")
            
            //5.2将window上的rect转换成在另外一个window为坐标系的rect
            let rect = CGRect(x: 50, y: 50, width: 100, height: 100)
            var convertRect = viewWindow.convert(rect, to: testWindow)
            debugPrint("convertRect:\(convertRect)")
            convertRect = testWindow.convert(rect, to: viewWindow)
            debugPrint("convertRect:\(convertRect)")
            
            //5.3将另外一个window上的point转换到该window为坐标系的位置
            convertPoint = viewWindow.convert(point, from: testWindow)
            debugPrint("convertPoint:\(convertPoint)")
            
            //5.4将另外一个window上的rect转换成以该window的坐标系上的rect
            convertRect = viewWindow.convert(rect, from: testWindow)
            debugPrint("convertRect:\(convertRect)")


            
        }
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        
        if let _ = self.testWindow {
            self.testWindow?.rootViewController = nil
            self.testWindow?.isHidden = true
            self.testWindow = nil;
        }
    }
}

