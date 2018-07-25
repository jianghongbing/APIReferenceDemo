//
//  PopAnimator.swift
//  UIViewControllerTransitioningDelegate
//
//  Created by pantosoft on 2018/7/25.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit

class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    private var operation = UINavigationControllerOperation.none
    public var navigationControllerOperation: UINavigationControllerOperation {
        return self.operation
    }
    
    init(operation: UINavigationControllerOperation) {
        self.operation = operation
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let duration = transitionDuration(using: transitionContext)
        let contianerView = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)!
        let toViewController = transitionContext.viewController(forKey: .to)!
        let toViewFinalFrame = transitionContext.finalFrame(for: toViewController)
        
        
        if operation == .push {
            contianerView.addSubview(toView)

            toView.frame = toViewFinalFrame.offsetBy(dx: toViewFinalFrame.width, dy: 0)
            UIView.animate(withDuration: duration, animations: {
                toView.frame = toViewFinalFrame
            }, completion: {_ in
                let transitionWasCancelled = transitionContext.transitionWasCancelled
                if transitionWasCancelled {
                    toView.removeFromSuperview()
                }
                transitionContext.completeTransition(!transitionWasCancelled)
            })
        }else if operation == .pop {
            let fromView = transitionContext.view(forKey: .from)!
            let fromViewController = transitionContext.viewController(forKey: .from)!
            let fromViewInitialFrame = transitionContext.initialFrame(for: fromViewController)
            let fromViewFinalFrame = fromViewInitialFrame.offsetBy(dx: fromViewInitialFrame.width, dy: 0)
            
            toView.frame = toViewFinalFrame.offsetBy(dx: -toViewFinalFrame.width * 0.3, dy: 0)
            contianerView.insertSubview(toView, belowSubview: fromView)
            fromView.layer.shadowOffset = CGSize(width: -3, height: 0)
            fromView.layer.shadowOpacity = 0.2
//            fromView.layer.shadowColor = UIColor.red.cgColor
            
            UIView.animate(withDuration: duration, animations: {
                toView.frame = toViewFinalFrame
                fromView.frame = fromViewFinalFrame
            }, completion: {_ in
                let transitionWasCancelled = transitionContext.transitionWasCancelled
                if transitionWasCancelled {
                    fromView.frame = fromViewInitialFrame
                }
                fromView.layer.shadowOpacity = 0.0
                
                transitionContext.completeTransition(!transitionWasCancelled)
            })
        }
    }
}
