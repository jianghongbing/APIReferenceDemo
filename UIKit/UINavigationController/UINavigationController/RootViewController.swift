//
//  RootViewController.swift
//  UINavigationController
//
//  Created by pantosoft on 2017/6/13.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UINavigationController"
        view.backgroundColor = .orange
        setupNavigationItem()
        //设置是否显示navigation bar,默认为ture
//        navigationController?.isNavigationBarHidden
//        navigationController?.setNavigationBarHidden(false, animated: true)
        //设置是否显示tool bar
//        navigationController?.isToolbarHidden
        navigationController?.setToolbarHidden(false, animated: true)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeLeft
    }
    
    // #MARK: private
    private func setupNavigationItem() {
        let leftBarButtonItemOne = UIBarButtonItem(title: "Push", style: .plain, target: self, action: #selector(pushController(_:)))
        let leftBarButtonItemTwo = UIBarButtonItem(title: "Show", style: .plain, target: self, action: #selector(showController(_:)))
        navigationItem.leftBarButtonItems = [leftBarButtonItemOne, leftBarButtonItemTwo]
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Set", style: .plain, target: self, action: #selector(setupViewControllers(_:)))
    }
    
    
    func pushController(_ barButtonItem: UIBarButtonItem) {
        //每一个controller所显示的返回键,都可以通过上一个控制器来进行定义
        if let backBarButtonItem = navigationItem.backBarButtonItem {
            backBarButtonItem.title = "jiang"
        }else {
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "123", style: .plain, target: nil, action: nil)
//            navigationItem.backBarButtonItem?.image = #imageLiteral(resourceName: "topbar_left_back")
//            navigationItem.backBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "topbar_left_back"), style: .plain, target: nil, action: nil)
        }
        //push view controller
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let stackViewController = storyboard.instantiateViewController(withIdentifier: StackViewController.nameInStoryboard)
        //当controller被推入栈时,是否异常bottom bar
        stackViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(stackViewController, animated: true)
    }
    
    func showController(_ barButtonItem: UIBarButtonItem) {
        // show controller和 push效果一样,show controller一般应用于interface build和segue中
        let stackViewController = StackViewController()
        navigationController?.show(stackViewController, sender: self);
    }
    
    
    func setupViewControllers(_ barButtonItem: UIBarButtonItem) {
        var viewControllers = navigationController?.viewControllers
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let stackViewControllerOne = storyboard.instantiateViewController(withIdentifier: StackViewController.nameInStoryboard)
        let stackViewControllerTwo = storyboard.instantiateViewController(withIdentifier: StackViewController.nameInStoryboard)
        let stackViewControllerThree = storyboard.instantiateViewController(withIdentifier: StackViewController.nameInStoryboard)
        
        //通过setViewContrller可以将navigationController栈的所有控制器给替换掉,该方法不仅可以实现push,pop的相关功能,还能实现其他特定的功能,比push,pop更强大
        viewControllers?.append(contentsOf: [stackViewControllerOne, stackViewControllerTwo, stackViewControllerThree])
        if let controllers = viewControllers {
            navigationController?.setViewControllers(controllers, animated: true)
        }
    }
    
}
