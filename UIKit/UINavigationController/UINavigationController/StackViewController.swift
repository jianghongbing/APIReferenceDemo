//
//  StackViewController.swift
//  UINavigationController
//
//  Created by pantosoft on 2017/6/13.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class StackViewController: UIViewController {
    static let nameInStoryboard = "StackViewController"
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(colorLiteralRed: Float(arc4random_uniform(255)) / 255.0, green: Float(arc4random_uniform(255)) / 255.0, blue: Float(arc4random_uniform(255)) / 255.0, alpha: 1.0)
        //设置返回键是否隐藏,默认为false
//        navigationItem.setHidesBackButton(true, animated: true)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "info", style: .plain, target: self, action: #selector(navigationControllerInfo(_:)))

    }
    
    func navigationControllerInfo(_ barButtonItem: UIBarButtonItem) {
        
        //top view controller, navigation controller栈顶控制器
        if let topViewController = navigationController?.topViewController {
            print("topViewController:\(topViewController)")
        }
        
        // visible view controller,可见控制器,如果存在modal controller,就返回modal controller, 如果不存在就返回top view controler
        if let visibleViewController = navigationController?.visibleViewController {
            print("visibleViewController: \(visibleViewController)")
        }
        
        
        let modalViewController = ModalViewController()
        let navigation = UINavigationController(rootViewController: modalViewController)
        present(navigation, animated: true) {
            if let topViewController = self.navigationController?.topViewController {
                print("topViewController:\(topViewController)")
            }
            if let visibleViewController = self.navigationController?.visibleViewController {
                print("visibleViewController: \(visibleViewController)")
            }
        }
    }
    
    
    
    
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func popViewController(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func popToSpecificViewController(_ sender: Any) {
        if let count = navigationController?.viewControllers.count, count > 3 {
            if let viewController = navigationController?.viewControllers[2] {
                navigationController?.popToViewController(viewController, animated: true)
            }
        }else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func popToRootViewController (_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    

}
