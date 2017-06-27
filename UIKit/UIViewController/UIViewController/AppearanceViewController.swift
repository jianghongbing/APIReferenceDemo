//
//  AppearanceViewController.swift
//  UIViewController
//
//  Created by pantosoft on 2017/6/26.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class AppearanceViewController: UIViewController {
    
    
    var showOrHidden = false
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
    
    //1.是否隐藏statusBar
    override var prefersStatusBarHidden: Bool {
        return showOrHidden
    }
    
    //2. 设置status bar style
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //3. controller支持的方向
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
    //4.是否支持自动旋转
    override var shouldAutorotate: Bool {
        return true 
    }
    
    //5.当viewController呈现出来的时候,所显示的方向,并且该方向必须是Controller支持的显示的方向的一种.
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .landscapeRight
    }
    
    //6.status bar显示和隐藏的时候,支持的动画
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .fade
    }
    
    //7.
    override class func attemptRotationToDeviceOrientation() {
        debugPrint(#function)
    }
    
    @IBAction func showOrHideStatusBar(_ sender: Any) {
        showOrHidden = !showOrHidden
        //更新状态栏外观
        setNeedsStatusBarAppearanceUpdate()
    }
}
