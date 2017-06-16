//
//  ColorViewController.swift
//  UISplitViewController
//
//  Created by pantosoft on 2017/6/15.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "push", style: .plain, target: self, action: #selector(pushController(_:)))
    }
    
    func pushController(_ barButtonItem: UIBarButtonItem) {
        if let isCollapsed = splitViewController?.isCollapsed, isCollapsed{
            print("isCollapsed:\(isCollapsed)")
        }

        let colorViewController = ColorViewController()
        colorViewController.view.backgroundColor = UIColor(colorLiteralRed: Float(arc4random_uniform(255)) / 255.0, green: Float(arc4random_uniform(255)) / 255.0, blue: Float(arc4random_uniform(255)) / 255.0, alpha: 1.0)
        navigationController?.pushViewController(colorViewController, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if navigationController != nil {
            navigationController?.popViewController(animated: true)
        }else if presentingViewController != nil {
            dismiss(animated: true, completion: nil)
        }
    }
}
