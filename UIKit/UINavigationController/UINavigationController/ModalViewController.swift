//
//  ModalViewController.swift
//  UINavigationController
//
//  Created by pantosoft on 2017/6/13.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "dismiss", style: .plain, target: self, action: #selector(dismissSelf(_:)))
    }

    func dismissSelf(_ barButtonItem: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

}
