//
//  CustomTransition2Delegate.swift
//  UIViewControllerTransitioningDelegate
//
//  Created by pantosoft on 2018/7/23.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit

class CustomTransition2Delegate: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    // MARK: UIViewControllerAnimatedTransitioning
    //1.动画的时长
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    //2.动画结束的时候的回调
    func animationEnded(_ transitionCompleted: Bool) {
        print((transitionCompleted ? "animation did end": "animation did cancel or interrupt"))
    }
    
    //3.执行动画的过程
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let duration = transitionDuration(using: transitionContext)
        let toView = transitionContext.view(forKey: .to)!
        let containView = transitionContext.containerView
        if transitionContext.viewController(forKey: .to)?.presentingViewController != nil {
            //Present
            containView.addSubview(toView)
            let toViewController = transitionContext.viewController(forKey: .to)!
            let toViewFinalFrame = transitionContext.finalFrame(for: toViewController)
            toView.transform = CGAffineTransform(translationX: -toViewFinalFrame.width, y: 0)
            UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity:0.5, options: [.curveEaseInOut], animations: {
                toView.transform = .identity
            }, completion: {
                transitionContext.completeTransition($0)
            })
        }else {
            //Dismiss
            containView.insertSubview(toView, at: 0)
            let fromViewController = transitionContext.viewController(forKey: .from)!
            let fromView = transitionContext.view(forKey: .from)!
            let fromViewInitialFrame = transitionContext.initialFrame(for: fromViewController)
            UIView.animate(withDuration: duration, delay: 0, options: [.curveLinear], animations: {
                fromView.alpha = 0;
                fromView.transform = CGAffineTransform(translationX: fromViewInitialFrame.width, y: 0)
            }, completion: {
                transitionContext.completeTransition($0)
            })
            
        }
    }
    
    // MARK: UIViewControllerTransitioningDelegate
    //4.返回一个动画器用于控制器被呈现的时候
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    //5.返回一个动画器用于控制器被dismiss的时候
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
}
