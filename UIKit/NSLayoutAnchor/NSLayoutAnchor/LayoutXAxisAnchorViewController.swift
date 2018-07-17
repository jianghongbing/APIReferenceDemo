//
//  LayoutXAxisAnchorViewController.swift
//  NSLayoutAnchor
//
//  Created by pantosoft on 2018/7/17.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit

class LayoutXAxisAnchorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let redView = createView(withbackgroundColor: .red)
        let blueView = createView(withbackgroundColor: .blue)
        let greenView = createView(withbackgroundColor: .green)
        
        let top = redView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
        let leading = redView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        let trailing = redView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        
        var height = redView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.1)
        NSLayoutConstraint.activate([top, leading, trailing, height])
        
        var centerX = blueView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        let centerY = blueView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        var width = blueView.widthAnchor.constraint(equalTo: redView.widthAnchor, multiplier: 0.8)
        height = blueView.heightAnchor.constraint(equalTo: redView.heightAnchor, multiplier: 2, constant: 0)
        NSLayoutConstraint.activate([centerX, centerY, width, height])
        
        
        let bottom = greenView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        
        width = greenView.widthAnchor.constraint(equalTo: redView.widthAnchor, multiplier: 0.6)
        height = greenView.heightAnchor.constraint(equalTo: redView.heightAnchor, multiplier: 3)
        centerX = greenView.centerXAnchor.constraint(equalTo: blueView.centerXAnchor)
        
        NSLayoutConstraint.activate([bottom, width, height, centerX])
    }
}
