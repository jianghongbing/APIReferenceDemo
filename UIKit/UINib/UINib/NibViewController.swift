//
//  NibViewController.swift
//  UINib
//
//  Created by pantosoft on 2018/7/18.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit

class NibViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.cornerRadius = 8.0
        button.backgroundColor = self.view.tintColor
        button.setTitleColor(.white, for: .normal)
    }
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
