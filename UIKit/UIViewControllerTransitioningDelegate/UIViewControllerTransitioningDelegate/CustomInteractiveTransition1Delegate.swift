//
//  CustomInteractiveTransition1Delegate.swift
//  UIViewControllerTransitioningDelegate
//
//  Created by pantosoft on 2018/7/24.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit

class CustomInteractiveTransition1Delegate: NSObject, UIViewControllerTransitioningDelegate, UIGestureRecognizerDelegate {
    public var gestureRecognizer: UIPanGestureRecognizer {
        didSet {
            gestureRecognizer.delegate = self
        }
    }
    init(gestureRecognizer: UIPanGestureRecognizer) {
        self.gestureRecognizer = gestureRecognizer
    }
    
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentAnimator()
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissAnimator()
    }
    
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return InteractiveTransitionAnimator(gestureRecognizer: gestureRecognizer)
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return InteractiveTransitionAnimator(gestureRecognizer: gestureRecognizer)
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if let panGestureRecognizer = gestureRecognizer as? UIPanGestureRecognizer {
            let transitionX = panGestureRecognizer.translation(in: gestureRecognizer.view).x
            if transitionX > 0 {
                return false
            }
        }
        return true
    }
}
