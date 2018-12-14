//
//  ViewController.swift
//  WKNavigationDelegate
//
//  Created by pantosoft on 2018/12/12.
//  Copyright © 2018 jianghongbing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segueIdentifier = segue.identifier, let viewController = segue.destination as? WebViewController {
            if(segueIdentifier == "local") {
                viewController.loadLocal = true
            }
        }
    }
}
