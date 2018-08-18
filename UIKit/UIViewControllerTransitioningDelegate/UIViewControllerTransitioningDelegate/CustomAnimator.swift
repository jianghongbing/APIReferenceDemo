//
//  CustomAnimator.swift
//  UIViewControllerTransitioningDelegate
//
//  Created by pantosoft on 2018/7/24.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit
class PresentAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let duration = transitionDuration(using: transitionContext)
        let fromView = transitionContext.view(forKey: .from)!
        let toView = transitionContext.view(forKey: .to)!
        let toViewController = transitionContext.viewController(forKey: .to)!
        let toViewFinalFrame = transitionContext.finalFrame(for: toViewController)
        let containerView = transitionContext.containerView
        containerView.addSubview(toView)
        toView.transform = CGAffineTransform(translationX: 0, y: toViewFinalFrame.height)
        
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.3, animations: {
                fromView.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
                toView.transform = .identity
            })
        }, completion: {complete in
            let transitionWasCancelled = transitionContext.transitionWasCancelled
            if(transitionWasCancelled) {
                toView.removeFromSuperview()
            }
            fromView.transform = .identity
            transitionContext.completeTransition(complete && !transitionWasCancelled)
        })
    }
}


class DismissAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let duration = transitionDuration(using: transitionContext)
        
        let fromView = transitionContext.view(forKey: .from)!
        let fromViewController = transitionContext.viewController(forKey: .from)!
        let fromViewInitialFrame = transitionContext.initialFrame(for: fromViewController)
        let toView = transitionContext.view(forKey: .to)!
        let containerView = transitionContext.containerView
        containerView.insertSubview(toView, belowSubview: fromView)
        toView.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                fromView.transform = CGAffineTransform(translationX: 0, y: fromViewInitialFrame.height)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
                toView.transform = .identity
            })
            
        }, completion: { complete in
            let transitionWasCancelled = transitionContext.transitionWasCancelled
            if(transitionWasCancelled) {
                toView.removeFromSuperview()
            }
            fromView.transform = .identity
            transitionContext.completeTransition(complete && !transitionWasCancelled)
        })
    }
}
