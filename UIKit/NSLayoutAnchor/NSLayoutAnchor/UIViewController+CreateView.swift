//
//  UIViewController+CreateView.swift
//  NSLayoutAnchor
//
//  Created by pantosoft on 2018/7/17.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit
extension UIViewController {
    func createView(withbackgroundColor backgroundColor: UIColor) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = backgroundColor
        self.view.addSubview(view)
        return view 
    }
}
