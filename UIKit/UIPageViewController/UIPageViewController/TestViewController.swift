//
//  TestViewController.swift
//  UIPageViewController
//
//  Created by pantosoft on 2017/6/16.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    fileprivate var tag = 0
    convenience init(tag: Int) {
        self.init()
        self.tag = tag
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "tag:\(tag)"
        view.addSubview(label)
        
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true 
    }
}
