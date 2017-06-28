//
//  ContainerViewController.swift
//  UIViewController
//
//  Created by pantosoft on 2017/6/28.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
    }
    
    
    @IBAction func addViewController(_ sender: Any) {
        let viewContorller = UIViewController()
//        viewContorller.preferredContentSize = CGSize(width: view.bounds.width, height: 100)
        viewContorller.view.backgroundColor = UIColor(colorLiteralRed: Float(arc4random_uniform(255)) / 255.0, green: Float(arc4random_uniform(255)) / 255.0, blue: Float(arc4random_uniform(255)) / 255.0, alpha: 1.0)
        
        viewContorller.willMove(toParentViewController: self)
        addChildViewController(viewContorller)
        view.addSubview(viewContorller.view)
        viewContorller.view.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 100)
        viewContorller.view.center = view.center
        viewContorller.didMove(toParentViewController: self)
    }
    
    @IBAction func removeViewController(_ sender: Any) {
        if let last = childViewControllers.last {
            last.willMove(toParentViewController: nil)
            last.view.removeFromSuperview()
            last.removeFromParentViewController()
            last.didMove(toParentViewController: nil)
        }
    }
    
    @IBAction func replaceViewController(_ sender: Any) {
        let viewControllers = childViewControllers
        
        let toViewController = UIViewController()
        toViewController.view.backgroundColor = UIColor(colorLiteralRed: Float(arc4random_uniform(255)) / 255.0, green: Float(arc4random_uniform(255)) / 255.0, blue: Float(arc4random_uniform(255)) / 255.0, alpha: 1.0)
        
        toViewController.willMove(toParentViewController: self)
        addChildViewController(toViewController)
        view.addSubview(toViewController.view)
        toViewController.view.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 100)
        toViewController.view.center = view.center
        toViewController.view.alpha = 0.0
        toViewController.didMove(toParentViewController: self)
        
        if let fromViewController = viewControllers.last {
//            beginAppearanceTransition(true, animated: false)
            transition(from: fromViewController, to: toViewController, duration: 0.5, options: .curveLinear, animations: {
                toViewController.view.alpha  = 1.0
                fromViewController.view.alpha = 0.0
                
            }, completion: {
                if $0 {
                    print("animation compelte")
                }
//                self.endAppearanceTransition()
            })
        }
    }
}
