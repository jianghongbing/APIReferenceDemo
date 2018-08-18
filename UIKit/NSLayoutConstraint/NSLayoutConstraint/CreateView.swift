//
//  CreateView.swift
//  NSLayoutConstraint
//
//  Created by pantosoft on 2018/7/16.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit
protocol CreateView {
    func createView(with backgroundColor: UIColor, superView: UIView) -> UIView
}

extension CreateView {
    func createView(with backgroundColor: UIColor, superView: UIView) -> UIView {
        let view = UIView()
        view.backgroundColor = backgroundColor
        view.translatesAutoresizingMaskIntoConstraints = false 
        superView.addSubview(view)
        return view
    }
}

