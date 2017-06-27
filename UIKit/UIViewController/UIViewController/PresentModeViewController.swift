//
//  PresentModeViewController.swift
//  UIViewController
//
//  Created by pantosoft on 2017/6/27.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class PresentModeViewController: UITableViewController, UIPopoverPresentationControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "test", style: .plain, target: nil, action: nil)
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = PresentViewController()
        switch indexPath.row {
        case 0:
            //push
            self.navigationController?.pushViewController(viewController, animated: true)
        case 1:
            //show:用于splitViewController中,否则和push效果一致
            show(viewController, sender: nil)
        case 2:
            //showDetail:用于splitViewController中,否则和modal效果一致
            showDetailViewController(viewController, sender: nil)
        case 3:
            //1.设置呈现的样式,比如是fullScreen还是popover,custom用户自定义转场动画的时候使用
            viewController.modalPresentationStyle = .pageSheet
            //2.设置系统默认提供的转场动画
            viewController.modalTransitionStyle = .crossDissolve
            present(viewController, animated: true, completion: nil)
        case 4:
            //3.设置modal的样式为popover
            viewController.modalPresentationStyle = .popover
            //4.所呈现的视图内容的大小
            viewController.preferredContentSize = CGSize(width: 100.0, height: 200.0)
            
            let popoverController = viewController.popoverPresentationController
            popoverController?.barButtonItem = navigationItem.rightBarButtonItem
            popoverController?.delegate = self
            present(viewController, animated: true, completion: nil)
        default:
            break
        }
    }
    
    // #MARK: UIPopoverPresentationControllerDelegate 
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }}

