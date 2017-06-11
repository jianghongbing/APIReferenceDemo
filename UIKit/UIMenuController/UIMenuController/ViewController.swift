//
//  ViewController.swift
//  UIMenuController
//
//  Created by jianghongbing on 2017/5/29.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!

    lazy var menuController: UIMenuController = {
        //UIMenuController是一个单例
        let menuController = UIMenuController.shared

        //UIMenuItem不需要指定target,它会依据响应者链去查找该方法,如果都没有实现,会抛出doesNotResonpedSelector的异常
        let copyItem = UIMenuItem(title: "复制", action: #selector(copyItemClicked(_:)))
        let pasteItem = UIMenuItem(title: "粘贴", action: #selector(pasteItemClicked(_:)))

        let moreItem = UIMenuItem(title: "...", action: #selector(moreItemClicked(_:)))

        menuController.menuItems = [copyItem, pasteItem, moreItem]
//        menuController.setTargetRect(self.button.frame, in: self.view)
        //在self.view的target rect上下左右的地方显示UIMenuController
        menuController.setTargetRect(CGRect(x: 100, y: 100, width: 200, height: 100), in: self.view)


        return menuController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        registerMenuControllerNotification()
        

    }
    deinit {
        unregisterMenuControllerNotification()
    }

    //必须实现下面的方法,UIMenuController才能显示出来
    override var canBecomeFirstResponder: Bool {
        return true
    }

    //显示指定的实现的action item,如果不override该方法,不是显示系统一些默认MenuItem
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return self.responds(to: action) && sender is UIMenuController
    }



    @IBAction func shorOrHideMenuController(_ sender: Any) {
        print(menuController.isMenuVisible)
        if menuController.isMenuVisible {
            menuController.setMenuVisible(false, animated: true)
        }else {
            menuController.arrowDirection = randomMenuControllerArrowDirection()
            menuController.setMenuVisible(true, animated: true)
        }
    }

    //MARK: 
    private func randomMenuControllerArrowDirection() -> UIMenuControllerArrowDirection {

        return UIMenuControllerArrowDirection(rawValue: Int(arc4random() % 5))!
    }
    // MARK: menuItem Action
    func copyItemClicked(_ item: UIMenuItem) {
        print("item:\(item),func:\(#function)")
    }

    func pasteItemClicked(_ item: UIMenuItem) {
        print("item:\(item),func:\(#function)")

    }

    func moreItemClicked(_ item: UIMenuItem) {
        print("item:\(item),func:\(#function)")

    }

    override func copy(_ sender: Any?) {
        print("copy item clicked:");
    }

    // MARK:UIMenuController notification 
    private func registerMenuControllerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(menuControllerWillShow(_:)), name: Notification.Name.UIMenuControllerWillShowMenu, object: nil)

        //与UIMenuController相关的通知名称
//        public static let UIMenuControllerWillShowMenu: NSNotification.Name,将要显示的时候会向target发送该消息
//
//        public static let UIMenuControllerDidShowMenu: NSNotification.Name,已经显示了,会向target发送该消息
//
//        public static let UIMenuControllerWillHideMenu: NSNotification.Name 将要隐藏的时候,会向target发送该消息
//
//        public static let UIMenuControllerDidHideMenu: NSNotification.Name 已经隐藏了,会向target发送该消息
//
//        public static let UIMenuControllerMenuFrameDidChange: NSNotification.Name frame改变的时候,会向target发送该消息
    }


    func menuControllerWillShow(_ notification: Notification) {
        print("menuControllerWillShow")
    }



    private func unregisterMenuControllerNotification() {
        NotificationCenter.default.removeObserver(self)
    }

}

