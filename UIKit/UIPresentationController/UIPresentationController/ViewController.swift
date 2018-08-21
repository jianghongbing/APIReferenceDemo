//
//  ViewController.swift
//  UIPresentationController
//
//  Created by pantosoft on 2018/7/27.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var customTransitioningDelegate: UIViewControllerTransitioningDelegate?
    @IBAction func buttonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationViewController = storyboard.instantiateViewController(withIdentifier: "destinationViewController")
        let presentationController = PresentationController(presentedViewController: destinationViewController, presenting: self)
        customTransitioningDelegate = presentationController
        destinationViewController.transitioningDelegate = presentationController
        destinationViewController.modalPresentationStyle = .custom
        present(destinationViewController, animated: true, completion: nil)
    }
}

