//
//  NavigationController.swift
//  UIViewControllerTransitioningDelegate
//
//  Created by pantosoft on 2018/7/24.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController, UINavigationControllerDelegate {
    private var pan: UIPanGestureRecognizer = UIPanGestureRecognizer()
    private var popViewControllerByGestureRecognizer = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        addPangestureRecognizer()
//        self.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    private func addPangestureRecognizer() {
        let view = self.interactivePopGestureRecognizer?.view
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlerPanGestureRecognizer(gestureRecognizer:)))
        panGesture.require(toFail: self.interactivePopGestureRecognizer!)
        pan = panGesture
        view?.addGestureRecognizer(panGesture)
    }
    @objc private func handlerPanGestureRecognizer(gestureRecognizer: UIPanGestureRecognizer) {
        print("pan navigation controller view")
        if gestureRecognizer.state == .began && self.viewControllers.count > 1{
            popViewControllerByGestureRecognizer = true
            popViewController(animated: true)
        }
    }
    
    // MARK: UINavigationControllerDelegate
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if(operation == .pop && popViewControllerByGestureRecognizer) {
            return PopAnimator(operation: operation)
        }
        return nil
//        return PopAnimator(operation: operation)
    }
    
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        print(animationController)
//        return InteractiveTransitionAnimator2(panGestureRecognizer: pan)
        if let popAnimator = animationController as? PopAnimator {
            if popAnimator.navigationControllerOperation == .pop && popViewControllerByGestureRecognizer {
                popViewControllerByGestureRecognizer = false
                return InteractiveTransitionAnimator2(panGestureRecognizer: pan)
            }
        }
        return nil
    }
    

    
    
}
