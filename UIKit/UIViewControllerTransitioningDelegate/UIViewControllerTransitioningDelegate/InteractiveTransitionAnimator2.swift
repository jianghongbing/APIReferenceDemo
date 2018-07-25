//
//  InteractiveTransitionAnimator2.swift
//  UIViewControllerTransitioningDelegate
//
//  Created by pantosoft on 2018/7/24.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit

class InteractiveTransitionAnimator2: UIPercentDrivenInteractiveTransition, UIGestureRecognizerDelegate{
    private let panGestureRecongizer: UIPanGestureRecognizer
    init(panGestureRecognizer: UIPanGestureRecognizer) {
        self.panGestureRecongizer = panGestureRecognizer
        super.init()
        self.panGestureRecongizer.addTarget(self, action: #selector(didPan(panGestureRecognizer:)))
//        self.panGestureRecongizer.delegate = self
    }
    
    @objc private func didPan(panGestureRecognizer: UIPanGestureRecognizer) {
        func animationPercent()-> CGFloat {
            let view = panGestureRecognizer.view!
            let transitionX = panGestureRecognizer.translation(in: view).x
            if transitionX < 0 {
                return 0
            }else {
                return (transitionX / view.frame.width)
            }
        }
        
        let percent = animationPercent()
        switch panGestureRecognizer.state {
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
    
    
    // MARK:UIGestureRecognizerDelegate
//    internal func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
//        if let pan = gestureRecognizer as? UIPanGestureRecognizer {
//            let view = pan.view
//            let transitionX = pan.translation(in: view).x
//            if transitionX <= 0 {
//                return false
//            }
//        }
//        return true
//    }
    
    deinit {
        panGestureRecongizer.removeTarget(self, action: #selector(didPan(panGestureRecognizer:)))
    }
}
