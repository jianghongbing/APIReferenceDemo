//
//  SecondViewController.swift
//  UIViewControllerPreviewingDelegate
//
//  Created by pantosoft on 2018/6/27.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    var previewActionHandler: ((UIViewController) -> Void)?
    override var previewActionItems: [UIPreviewActionItem] {
        func previewActionItem(withTitle title: String, style: UIPreviewActionStyle = .default, action:((UIViewController)-> Void)?) -> UIPreviewAction {
            let previewAction = UIPreviewAction(title: title, style: style) { previewAction, viewController in
                if let action = action {
                    action(viewController)
                }
            }
            return previewAction
        }
        
        func changeTextColor(to color:UIColor, for controller: UIViewController) {
            if let secondViewController = controller as? SecondViewController, let handler = secondViewController.previewActionHandler {
                handler(controller)
                secondViewController.label.textColor = color
                secondViewController.label.text = "Push by 3DTouch preview action"
            }
        }
        
        let redColorAction = previewActionItem(withTitle: "red") { viewController in
            changeTextColor(to: .red, for: viewController)
        }
        
        let blueColorAction = previewActionItem(withTitle: "blue") { viewController in
            changeTextColor(to: .blue, for: viewController)

        }
        
        let greenColorAction = previewActionItem(withTitle: "green") { viewController in
            changeTextColor(to: .green, for: viewController)
        }
        let selectColorAction = UIPreviewActionGroup(title: "select a color", style: .default, actions: [redColorAction, blueColorAction, greenColorAction])
        
        let selectedAction = previewActionItem(withTitle: "selected", action: nil)
        
        let deleteAction = previewActionItem(withTitle: "delete", style: .destructive, action: nil)
        
        return [selectColorAction, selectedAction, deleteAction]
    }
    
    deinit {
        previewActionHandler = nil
    }
}
