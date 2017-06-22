//
//  TestViewController.swift
//  UIWindow
//
//  Created by pantosoft on 2017/6/22.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.red
    }


    @IBAction func logInfo(_ sender: Any) {
        let windows =  UIApplication.shared.windows
        windows.forEach {
            debugPrint($0,$0.isKeyWindow)
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
