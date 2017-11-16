//
//  ViewController.swift
//  UIGravityBehavior
//
//  Created by pantosoft on 2017/11/15.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var dynamicAnimator: UIDynamicAnimator = {
        return UIDynamicAnimator(referenceView: view)
    }()
    @IBOutlet weak var animatorView: UIView!
    @IBOutlet weak var orangeView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //UIGravityBehavior:重力感应,让view模拟重力感应行为
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dynamicAnimator.removeAllBehaviors()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            let point = touch.location(in: view)
//            guard animatorView.frame.contains(point) else { return }
            animatorView.center = point
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //1.behavior的创建
        let behavior = UIGravityBehavior(items: [animatorView])
        //2.添加新的item
        behavior.addItem(orangeView)
        //3.设置重力方向,通gravityDirection的值,可以计算出下降的方向和加速度的大小,因此会改变angle和magnutude的值
        behavior.gravityDirection = CGVector(dx: 1, dy: 1)
        print(behavior.gravityDirection, behavior.angle, behavior.magnitude)
        //4.设置重力方向,默认为90度,该变angle的值,会改变gravityDirection的值
        behavior.angle = CGFloat.pi * 2
        //5.设置重力加速度的大小,默认为1.0,改变magnitude的值,会改变gravityDirection的值
        behavior.magnitude = 0.5
        //6.
//        behavior.setAngle(<#T##angle: CGFloat##CGFloat#>, magnitude: <#T##CGFloat#>)
        print(behavior.gravityDirection, behavior.angle, behavior.magnitude)
        dynamicAnimator.addBehavior(behavior)
    }
}

