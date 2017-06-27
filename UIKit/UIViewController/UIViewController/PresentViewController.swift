//
//  PresentViewController.swift
//  UIViewController
//
//  Created by pantosoft on 2017/6/27.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class PresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let _ = presentingViewController {
            dismiss(animated: true, completion: nil)
        }else if let _ = navigationController {
            navigationController?.popViewController(animated: true)
        }
    }
}
