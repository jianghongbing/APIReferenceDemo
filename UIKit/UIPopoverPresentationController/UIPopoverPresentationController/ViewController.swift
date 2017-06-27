//
//  ViewController.swift
//  UIPopoverPresentationController
//
//  Created by pantosoft on 2017/6/20.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate{
    weak var popoverViewController: UIPopoverPresentationController?
    @IBOutlet weak var centerButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func showPopover(_ sender: Any) {
        //UIPopoverPresentationController
        let tableViewController = TableViewController()
        tableViewController.delegate = self
        //1.如果想实现popover效果,需要将modalPresentationStyle设置为popover
        tableViewController.modalPresentationStyle = .popover
        //2.设置popover中的controller的内容大小
        tableViewController.preferredContentSize = CGSize(width: 100, height: 250)
        
        //3.获取popoverController
        let popoverController = tableViewController.popoverPresentationController
        //4.设置popover箭头指向的方向
        popoverController?.permittedArrowDirections = .up
        //5.设置popoverController的指向的目标为barButtonItem
        popoverController?.barButtonItem = sender as? UIBarButtonItem
        //6.设置background
        popoverController?.backgroundColor = UIColor.orange
        //7.设置delegate
        popoverController?.delegate = self
        
        present(tableViewController, animated: true, completion: nil)
    }
    
    // #MARK: UIPopoverPresentationControllerDelegate
    //如果想在iPhone上出现popover的效果,必须实现代理该方法并且style值返回.none,否则以全屏modal的形式呈现,默认为以modal的形式呈现另外一个控制器.不是popover效果,如果仅用在iPad上,可不用实现该方法
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    // 在弹出popover之前,在这个方法里面可以做一些准备工作
    func prepareForPopoverPresentation(_ popoverPresentationController: UIPopoverPresentationController) {
        debugPrint(#function)
    }
    // 是否允许dismiss popover(手动调用controller的dismiss方法,不会受到影响),默认为true
    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        debugPrint(#function)
        return true
    }
    
    // 当popover已经dismiss的时候,delegate会收到该消息
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        debugPrint(#function)

    }
    
    // 当popover的size或者view发生变化时,delegate会收到该消息
    func popoverPresentationController(_ popoverPresentationController: UIPopoverPresentationController, willRepositionPopoverTo rect: UnsafeMutablePointer<CGRect>, in view: AutoreleasingUnsafeMutablePointer<UIView>) {
        debugPrint(#function,rect, view)
    }
    
    // #MARK: IBAction
    @IBAction func buttonClicked(_ sender: Any) {
        let button = sender as! UIButton
        var permittedArrowDirection = UIPopoverArrowDirection.unknown
        switch button.tag {
        case 1:
            permittedArrowDirection = [.up, .left]
        case 2:
            permittedArrowDirection = [.up, .right]
        case 3:
            permittedArrowDirection = [.down, .left]
        case 4:
            permittedArrowDirection = [.down, .right]
        default:
            break
        }
        
        let viewController = UIViewController()
        viewController.modalPresentationStyle = .popover
        viewController.view.backgroundColor = UIColor.red
        viewController.preferredContentSize = CGSize(width: 100, height: 200)
        
        let popoverController = viewController.popoverPresentationController
        //8.设置用来固定popover,相当于锚点的作用,和sourceRect配合使用
        popoverController?.sourceView = button
        //9.设置popover箭头出现的范围,以sourceview 为锚点
        popoverController?.sourceRect = button.bounds
        popoverController?.backgroundColor = UIColor.orange
        popoverController?.permittedArrowDirections = permittedArrowDirection
        popoverController?.delegate = self
        //10.设置popover出现后,还可以交互的view,默认popover出现后,后面会出现一层阴影来覆盖整个屏幕,不允许和其他的View交互
        popoverController?.passthroughViews = [centerButton]
        //设置popover的到屏幕的四周所允许的误差范围.默认为(10,10,10,10)
        popoverController?.popoverLayoutMargins = UIEdgeInsetsMake(10, 5, 10, 0);
        popoverViewController = popoverController
        present(viewController, animated: true, completion: nil)
    }
    @IBAction func centerButtonClicked(_ sender: UIButton) {
        if let popoverViewController = self.popoverViewController {
            popoverViewController.presentingViewController.dismiss(animated: true, completion: nil)
        }
        
        let viewController = UIViewController()
        viewController.modalPresentationStyle = .popover
        viewController.view.backgroundColor = UIColor.red
        viewController.preferredContentSize = CGSize(width: 100, height: 200)
        
        let popoverController = viewController.popoverPresentationController
        popoverController?.sourceView = sender
        popoverController?.sourceRect = sender.bounds
//        popoverController?.backgroundColor = UIColor.orange
        popoverController?.permittedArrowDirections = .up
        popoverController?.delegate = self
        
        popoverController?.popoverBackgroundViewClass = PopoverBackgroundView.classForCoder() as? UIPopoverBackgroundViewMethods.Type
        
        present(viewController, animated: true, completion: nil)
    }
}

extension ViewController: TableViewControllerDelegate {
    func tableViewController(_ tableViewController: TableViewController, didSelectRowAt indexPath: IndexPath) {
        debugPrint(#function)
    }
}
