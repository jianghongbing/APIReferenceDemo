//
//  TableViewController.swift
//  UIViewControllerTransitioningDelegate
//
//  Created by pantosoft on 2018/7/23.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var customTransitionDelegate: UIViewControllerTransitioningDelegate?
    enum SegueIdentifier: String{
        case customTransition1 = "CustomTransition1"
        case customTransition2 = "CustomTransition2"
        init?(rawValue:String) {
            switch rawValue {
            case SegueIdentifier.customTransition1.rawValue:
                self = .customTransition1
            case SegueIdentifier.customTransition2.rawValue:
                self = .customTransition2
            default:
                return nil
            }
        }
        
        init?(identifier: String?) {
            guard let rawValue = identifier else {
                return nil
            }
            self.init(rawValue: rawValue)
        }
    }
    
    
    @IBAction func unwindToTableViewController(segue: UIStoryboardSegue) {}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segueIdentifer = SegueIdentifier(identifier: segue.identifier) {
            let desitination = segue.destination
            switch segueIdentifer {
            case SegueIdentifier.customTransition1:
                customTransitionDelegate = CustomTransition1Delegate()
            case SegueIdentifier.customTransition2:
                customTransitionDelegate = CustomTransition2Delegate()
            }
            desitination.transitioningDelegate = customTransitionDelegate
        }
        
    }
}
