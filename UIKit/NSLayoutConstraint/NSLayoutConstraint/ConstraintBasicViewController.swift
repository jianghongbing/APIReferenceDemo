//
//  ConstraintBasicViewController.swift
//  NSLayoutConstraint
//
//  Created by pantosoft on 2018/7/16.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit

class ConstraintBasicViewController: UIViewController, CreateView {
    override func viewDidLoad() {
        super.viewDidLoad()
        //NSLayoutConstraints的构建
        let redView = createView(with: .red, superView: self.view)
        let top = NSLayoutConstraint(item: redView, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 30)
        let left = NSLayoutConstraint(item: redView, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 20)
        let width = NSLayoutConstraint(item: redView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 200)
        let height = NSLayoutConstraint(item: redView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 40)
        
        top.identifier = "view one top layout constraint" //设置constraint的identifier,用于debug,当出现约束冲突时,在控制台上,更容易找到相关的信息
        //修改约束的优先级,范围为0~1000,relation为.equal值的为required的constraint的优先级的值不能修改,在constraint激活后,constraint的优先级也不能改
//        top.priority = .defaultHigh + 1
//        let bottom = NSLayoutConstraint(item: redView, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: -50)
        //激活LayoutConstraint
        //view.addConstraint(top) //view添加constraint,不推荐,使用NSLayoutConstraint的activate的API
        //view.addConstraints([top, left, width, height]) //view添加多条constraint,不推荐,使用NSLayoutConstraint的activate的API
        top.isActive = true //激活某一条constraint,获取取消激活某条constraint
        NSLayoutConstraint.activate([left, width, height]) //同时激活多条constraint,效率更高
        
//        NSLayoutConstraint.deactivate([top, left, width, height]); //同时取消激活多条constraint
        //是否需要归档,默认值为false,告知view是否有特殊的constraint进行归档
        top.shouldBeArchived = true
//        print("redViewConstraints:\(redView.constraints)\nviewConstraints:\(view.constraints)")
        //获取contraint的相关属性
        let firstItem = top.firstItem! //first item
        let firstAttribute = top.firstAttribute //first item布局属性
        let relation = top.relation //关系
        let secondItem = top.secondItem!
        let secondAttribute = top.secondAttribute
        let multiplier = top.multiplier //倍数
        let constant = top.constant //倍数之外的常数
        let firstAnchor = top.firstAnchor
        let secondAnchor = top.secondAnchor!
        
        print(firstItem, firstAnchor, secondItem, secondAnchor)
        print(relation.rawValue, firstAttribute.rawValue, secondAttribute.rawValue, multiplier, constant)
        
        let greenView = createView(with: .green, superView: view)
        let blueView = createView(with: .blue, superView: view)
        let orangeView = createView(with: .orange, superView: view)
        
        let greenViewTop = NSLayoutConstraint(item: greenView, attribute: .top, relatedBy: .equal, toItem: redView, attribute: .bottom, multiplier: 1.0, constant: 20)
        let greenViewLeading = NSLayoutConstraint(item: greenView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1.0, constant: 20)
        let greenViewTrailing = NSLayoutConstraint(item: greenView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1.0, constant: -20)
        let greenViewBottom = NSLayoutConstraint(item: greenView, attribute: .bottom, relatedBy: .equal, toItem: blueView, attribute: .top, multiplier: 1.0, constant: -20)
        let greenViewHeight = NSLayoutConstraint(item: greenView, attribute: .height, relatedBy: .equal, toItem: blueView, attribute: .height, multiplier: 1.0, constant: 0)
        
        let blueViewLeading = NSLayoutConstraint(item: blueView, attribute: .leading, relatedBy: .equal, toItem: greenView, attribute: .leading, multiplier: 1.0, constant: 0)
//        let blueViewTrailing = NSLayoutConstraint(item: blueView, attribute: .trailing, relatedBy: .equal, toItem: greenView, attribute: .trailing, multiplier: 1.0, constant: 0)
        let blueViewWidth = NSLayoutConstraint(item: blueView, attribute: .width, relatedBy: .equal, toItem: orangeView, attribute: .width, multiplier: 1.0, constant: 0)
        let blueViewBottom = NSLayoutConstraint(item: blueView, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: -20)
        
        let orangeViewLeading = NSLayoutConstraint(item: orangeView, attribute: .leading, relatedBy: .equal, toItem: blueView, attribute: .trailing, multiplier: 1.0, constant: 20)
        let orangeViewTrailing = NSLayoutConstraint(item: orangeView, attribute: .trailing, relatedBy: .equal, toItem: greenView, attribute: .trailing, multiplier: 1.0, constant: 0)
        let orangeViewTop = NSLayoutConstraint(item: orangeView, attribute: .top, relatedBy: .equal, toItem: blueView, attribute: .top, multiplier: 1.0, constant: 0)
        let orangeViewBottom = NSLayoutConstraint(item: orangeView, attribute: .bottom, relatedBy: .equal, toItem: blueView, attribute: .bottom, multiplier: 1.0, constant: 0)
        
        NSLayoutConstraint.activate([greenViewTop, greenViewLeading, greenViewBottom, greenViewTrailing, greenViewHeight, blueViewLeading, blueViewWidth, blueViewBottom, orangeViewLeading, orangeViewTrailing, orangeViewTop, orangeViewBottom])
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(self.view.layoutMargins)
    }

}
