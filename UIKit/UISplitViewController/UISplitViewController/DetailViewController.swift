//
//  DetailViewController.swift
//  UISplitViewController
//
//  Created by pantosoft on 2017/6/15.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "DetailViewController"
        
        let indicatorLabel = UILabel()
        indicatorLabel.translatesAutoresizingMaskIntoConstraints = false
        indicatorLabel.textColor = .orange
        indicatorLabel.text = "DetailViewController"
        view.addSubview(indicatorLabel)
        
        indicatorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        indicatorLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        //将navigationItem的left button item 设置为 splitViewController的displayModeButtonItem.点击会呈现splitViewController的masterViewController
        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
    }
}
