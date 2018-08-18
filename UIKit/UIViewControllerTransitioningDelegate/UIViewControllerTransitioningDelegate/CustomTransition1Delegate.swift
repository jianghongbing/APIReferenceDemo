//
//  CustomTransition1Delegate.swift
//  UIViewControllerTransitioningDelegate
//
//  Created by pantosoft on 2018/7/23.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit

class CustomTransition1Delegate:NSObject, UIViewControllerTransitioningDelegate {
    private static let duration: TimeInterval = 0.5
    class PresentAnimator: NSObject, UIViewControllerAnimatedTransitioning {
        func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
            return CustomTransition1Delegate.duration
        }
        
        func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
            let toView = transitionContext.view(forKey: .to)!
            transitionContext.containerView.addSubview(toView)
            toView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            toView.alpha = 0.0
            UIView.animate(withDuration: CustomTransition1Delegate.duration, animations: {
                toView.transform = .identity
                toView.alpha = 1.0
            }, completion: {
                transitionContext.completeTransition($0)
            })
        }
    }
    
    
    class DismissAnimator: NSObject, UIViewControllerAnimatedTransitioning {
        func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
            return CustomTransition1Delegate.duration
        }
        
        func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
            let fromView = transitionContext.view(forKey: .from)!
            let toView = transitionContext.view(forKey: .to)!
            transitionContext.containerView.insertSubview(toView, at: 0)
            UIView.animate(withDuration: CustomTransition1Delegate.duration, animations: {
                fromView.transform = CGAffineTransform(scaleX: 5.0, y: 5.0)
                fromView.alpha = 0.0
            }, completion: {
                transitionContext.completeTransition($0)
            })
        }
    }
    
    
    
    
    
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentAnimator()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissAnimator()
    }
}
