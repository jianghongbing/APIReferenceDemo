//
//  BViewController.swift
//  UIStoryboardSegue
//
//  Created by pantosoft on 2018/7/12.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit

class BViewController: UIViewController {
    @IBAction func backToSelf(segue:UIStoryboardSegue) {
        print("segue:\(segue)")
    }
    
    //是否可以执行某个segue
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "anInvalidSegue" {
            return false
        }else {
            return super.shouldPerformSegue(withIdentifier: identifier, sender: sender)
        }
    }
    
    //执行某个segue的渝北操作,可以override这个方法,用于传递数据给目标控制器
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination
        if let identifier = segue.identifier {
            if identifier == "noAnimationSegue", let label = destinationViewController.view.viewWithTag(1000) as? UILabel {
                label.text = "Modal with no animation"
            }else if identifier == "customTransitionSegue", let label = destinationViewController.view.viewWithTag(1000) as? UILabel {
                label.text = "Modal with a custom animation"
            }
        }
    }
    
    @IBAction func manualTriggerSegue(_ sender: Any) {
        performSegue(withIdentifier: "anInvalidSegue", sender: sender)
    }
    
    //是否可以执行某个unwindSegueAction
    override func canPerformUnwindSegueAction(_ action: Selector, from fromViewController: UIViewController, withSender sender: Any) -> Bool {
        return true
    }
    //在unwindAction中,允许被找到的childViewControllers的数组
//    override func allowedChildViewControllersForUnwinding(from source: UIStoryboardUnwindSegueSource) -> [UIViewController] {
//        <#code#>
//    }
    //包含某个unwindSegue的childViewController
//    override func childViewControllerContaining(_ source: UIStoryboardUnwindSegueSource) -> UIViewController? {
//
//    }
    
    //执行某个unwindSegue的时候,会回调方法,容器控制器可以重写该方法,来进行拦截进行某些操作
//    override func unwind(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
//
//    }
    
}
