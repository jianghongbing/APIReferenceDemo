//
//  AContainerViewController.swift
//  UIStoryboardSegue
//
//  Created by pantosoft on 2018/7/12.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit

class AContainerViewController: UIViewController {
    @IBAction func unwindToContainerViewController(segue:UIStoryboardSegue) {
        print("unwindTo:\(self.classForCoder),func:\(#function),line:\(#line)")
    }

}
