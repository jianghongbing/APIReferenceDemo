//
//  AnimationViewController.swift
//  NSLayoutConstraint
//
//  Created by pantosoft on 2018/7/17.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController, CreateView{
    private var redView: UIView!
    private var top: NSLayoutConstraint!
    private var leading: NSLayoutConstraint!
    private var bottom: NSLayoutConstraint!
    private var trailing: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        redView = createView(with: .red, superView: view)
        let inset:CGFloat = 20
        top = NSLayoutConstraint(item: redView, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: inset)
        leading = NSLayoutConstraint(item: redView, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: inset)
        bottom = NSLayoutConstraint(item: redView, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: -inset)
        trailing = NSLayoutConstraint(item: redView, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: -inset)
        NSLayoutConstraint.activate([top, leading, bottom, trailing])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startAnimation(useLargeMargin: true)
    }
    
    private func startAnimation(useLargeMargin: Bool) {
        let inset: CGFloat = useLargeMargin ? 50 : 20
        top.constant = inset
        leading.constant = inset
        bottom.constant = -inset
        trailing.constant = -inset
        UIView.animate(withDuration: 1.0, animations: {
            self.view.layoutIfNeeded()
        }, completion: {
            _ in
            self.startAnimation(useLargeMargin: !useLargeMargin)
        })
    }
}
