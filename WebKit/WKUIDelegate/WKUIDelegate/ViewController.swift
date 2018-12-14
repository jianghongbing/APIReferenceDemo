//
//  ViewController.swift
//  WKUIDelegate
//
//  Created by pantosoft on 2018/12/14.
//  Copyright © 2018 jianghongbing. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? WebViewController else {
            return
        }
        if let identifier = segue.identifier, identifier == "local" {
            viewController.loadHTMLFromLocal = true
        }
    }
}



