//
//  PresentedViewController.swift
//  UIViewControllerTransitioningDelegate
//
//  Created by pantosoft on 2018/7/24.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit

class PresentedViewController: UIViewController {
    @IBOutlet var gestureRecognizer: UIPanGestureRecognizer!
    @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
        if sender.state == .began {
            performSegue(withIdentifier: "CustomDismissInteractiveAnimator", sender: sender)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier, identifier == "CustomDismissInteractiveAnimator" {
            if let customInteractiveTransition1Delegate = self.transitioningDelegate as? CustomInteractiveTransition1Delegate, let gesture = sender as? UIPanGestureRecognizer{
                customInteractiveTransition1Delegate.gestureRecognizer = gesture
            }
        }
    }
}
