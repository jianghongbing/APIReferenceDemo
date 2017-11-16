//
//  ViewController.swift
//  UICollisionBehavior
//
//  Created by pantosoft on 2017/11/16.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var dynamicAnimator: UIDynamicAnimator = {
        return UIDynamicAnimator(referenceView: view)
    }()
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var orangeView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //UICollisionBehavior:碰撞行为
        let gravityBehavior = UIGravityBehavior(items: [redView, orangeView])
        gravityBehavior.magnitude = 0.5
        dynamicAnimator.addBehavior(gravityBehavior)
        
        //1.碰撞行为的构建
        let collisionBehavior = UICollisionBehavior(items: [redView, orangeView])
        //2.添加碰撞范围,在指定的区域中发生碰撞
//        let path = UIBezierPath(rect: CGRect(x:200, y:100, width:0.5, height: 0.5))
//        collisionBehavior.addBoundary(withIdentifier: "boundaryOne" as NSCopying, for: path)
        //3.两点练成线,作为碰撞范围
        let fromPoint = CGPoint(x: 0, y: 0)
        let toPoint = CGPoint(x: UIScreen.main.bounds.width, y: UIScreen.main.bounds.height)
        collisionBehavior.addBoundary(withIdentifier: "boundaryTwo" as NSCopying, from: fromPoint, to: toPoint)
        //4.设置碰撞模式
        //4.1 items之间碰撞
        //4.2 boundaries与碰撞范围接触时产生碰撞
        //4.3 everything:items和boundaries接触时都产生碰撞效果,默认为everything
        collisionBehavior.collisionMode = .everything
        //5.设置delegate
        collisionBehavior.collisionDelegate = self
        //6.是否采用animator的referenceView的bounds作为碰撞边界,默认为false
//        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        //7.以animator的referenceView的bounds内边距为insets的范围作为碰撞范围
        collisionBehavior.setTranslatesReferenceBoundsIntoBoundary(with: UIEdgeInsetsMake(50, 50, 50, 50))
        //8.获取所有的碰撞范围的identifier
        if let identifiers = collisionBehavior.boundaryIdentifiers {
            for identifier in identifiers {
                print("identifier:\(identifier)")
            }
        }
        //9.移除item
//        collisionBehavior.removeItem(<#T##item: UIDynamicItem##UIDynamicItem#>)
        
        //10.移除指定的碰撞边界
//        collisionBehavior.removeBoundary(withIdentifier: <#T##NSCopying#>)
        //11.移除所有的碰撞边界
//        collisionBehavior.removeAllBoundaries()
        dynamicAnimator.addBehavior(collisionBehavior)
    }
}

extension ViewController: UICollisionBehaviorDelegate {
    //UICollisionBehaviorDelegate,发生碰撞时和结束碰撞的回调
    //1.item之间发生碰撞时的回调
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item1: UIDynamicItem, with item2: UIDynamicItem, at p: CGPoint) {
        print(#line, #function)
    }
    //2.item之间结束碰撞时的回调
    func collisionBehavior(_ behavior: UICollisionBehavior, endedContactFor item1: UIDynamicItem, with item2: UIDynamicItem) {
        print(#line, #function)
    }
    //3.与边界发生碰撞的回调
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        print(#line, #function)
    }
    
    //4.与边界结束碰撞的回调
    func collisionBehavior(_ behavior: UICollisionBehavior, endedContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?) {
        print(#line, #function)
    }
}

