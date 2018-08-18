//
//  CustomTransitionSegue.swift
//  UIStoryboardSegue
//
//  Created by pantosoft on 2018/7/13.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit

class CustomTransitionSegue: UIStoryboardSegue {
    override func perform() {
        destination.transitioningDelegate = self
        super.perform()
    }
}

extension CustomTransitionSegue: UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    //MARK: UIViewControllerTransitioningDelegate
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    //MARK: UIViewControllerAnimatedTransitioning
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView;
        let toViewController = transitionContext.viewController(forKey: .to)!
        let toView = transitionContext.view(forKey: .to)!
        let duration = transitionDuration(using: transitionContext)
        if toViewController == destination {
            //present
            containerView.addSubview(toView)
            toView.alpha = 0

            let toViewFinalFrame = transitionContext.finalFrame(for: toViewController)
            var frame = toViewFinalFrame;
            frame.origin.y -= frame.size.height
            toView.frame = frame
            UIView.animate(withDuration: duration, animations: {
                toView.alpha = 1.0
                toView.frame = toViewFinalFrame
            }, completion: {
                transitionContext.completeTransition($0)
            })
        }else {
            //dismiss
            let fromViewController = transitionContext.viewController(forKey: .from)!
            let fromViewInitialFrame = transitionContext.initialFrame(for: fromViewController)
            var frame = fromViewInitialFrame
            frame.origin.y += frame.size.height
            let fromView = transitionContext.view(forKey: .from)!
            containerView.insertSubview(toView, belowSubview: fromView)
            UIView.animate(withDuration:duration, animations: {
                fromView.frame = frame
            }, completion: {transitionContext.completeTransition($0)})
        }
    }
}






