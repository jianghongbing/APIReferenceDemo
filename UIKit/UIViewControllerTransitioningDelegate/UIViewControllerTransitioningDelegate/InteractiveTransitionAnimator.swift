//
//  InteractiveTransitionAnimator.swift
//  UIViewControllerTransitioningDelegate
//
//  Created by pantosoft on 2018/7/24.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit
class InteractiveTransitionAnimator: UIPercentDrivenInteractiveTransition {
    private var gestureRecognizer: UIPanGestureRecognizer {
        didSet {
            oldValue.removeTarget(self, action: #selector(handlePanGestureRecognizerEvent(gestureRecognizer:)))
            gestureRecognizer.addTarget(self, action: #selector(handlePanGestureRecognizerEvent(gestureRecognizer:)))
        }
    }
    init(gestureRecognizer: UIPanGestureRecognizer) {
        self.gestureRecognizer = gestureRecognizer
        super.init()
        self.gestureRecognizer.addTarget(self, action: #selector(handlePanGestureRecognizerEvent(gestureRecognizer:)))
    }
    
    @objc private func handlePanGestureRecognizerEvent(gestureRecognizer: UIPanGestureRecognizer) {
        func animationPercent()-> CGFloat {
            let view = gestureRecognizer.view!
            let transitionX = gestureRecognizer.translation(in: view).x
            if transitionX > 0 {
                return 0
            }else {
               return -(transitionX / view.frame.width)
            }
        }
        
        let percent = animationPercent()
        switch gestureRecognizer.state {
        case .began:
            break
        case .changed:
            update(percent)
        case .ended:
            percent > 0.5 ? finish() : cancel()
        default:
            cancel()
        }
    }
    
    deinit {
        gestureRecognizer.removeTarget(self, action: #selector(handlePanGestureRecognizerEvent(gestureRecognizer:)))
    }
    
    
}



//class InteractiveTransitionPresentAnimator: UIPercentDrivenInteractiveTransition {
////    let duration: TimeInterval = 0.5
////    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
////        return duration
////    }
////
////    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
////
////    }
//}
//
//class InteractiveTransitionDimmissAnimator: UIPercentDrivenInteractiveTransition {
//    
//}
