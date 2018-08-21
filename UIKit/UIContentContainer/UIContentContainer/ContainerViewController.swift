//
//  ContainerViewController.swift
//  UIContentContainer
//
//  Created by pantosoft on 2018/8/21.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        addSubViewControllers()
    }
    private func addSubViewControllers() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let firstViewController = storyboard.instantiateViewController(withIdentifier: "firstViewController")
        firstViewController.willMove(toParentViewController: self)
        firstViewController.view.willMove(toSuperview: view)
        view.addSubview(firstViewController.view)
        firstViewController.view.didMoveToSuperview()
        addChildViewController(firstViewController)
        firstViewController.didMove(toParentViewController: self)
    }
    
    override func viewDidLayoutSubviews() {
        let firstViewController = childViewControllers.first!
        let size = firstViewController.preferredContentSize
        firstViewController.view.frame = CGRect(origin: CGPoint(x: 0, y: view.bounds.height - size.height), size: size)
    }
    
    
    //MARK: UIContentContainer Method
    //1. viewController在parentViewController或则UIPresentationController中的偏好大小
    //    override var preferredContentSize: CGSize {
    //        return .zero
    //    }
    
    //2.容器控制器size发生变化的时候的回调
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
//        print("function:\(#function), line:\(#line), size:\(size), coordinator:\(coordinator)")
    }
    
    //3. viewController的traitCollection发生改变的回调
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
//        print("function:\(#function), line:\(#line),newCollection:\(newCollection),coordinator:\(coordinator)")
    }
    
    //4. 返回childViewController在containerViewController的大小
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
//        print("function:\(#function), line:\(#line), container:\(container),parentSize:\(parentSize)")
        if let firstViewController = childViewControllers.first, firstViewController === container {
            return container.preferredContentSize
        }else {
            return super.size(forChildContentContainer: container, withParentContainerSize: parentSize)
        }
    }
    //5.当某个childViewController的preferredContentSize发生改变时候的回调
    override func preferredContentSizeDidChange(forChildContentContainer container: UIContentContainer) {
//        print("function:\(#function), line:\(#line),container:\(container)")
        if let firstViewController = childViewControllers.first, firstViewController === container {
            view.setNeedsLayout()
        }
    }
    
    //6.childViewController通过auto layout 来调整视图大小的时候的回调
    override func systemLayoutFittingSizeDidChange(forChildContentContainer container: UIContentContainer) {
//        print("function:\(#function), line:\(#line),container:\(container)")
        if let firstViewController = childViewControllers.first, firstViewController === container {
            view.setNeedsLayout()
        }
 
    }
}
