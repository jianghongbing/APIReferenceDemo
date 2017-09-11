//
//  GeometryView.swift
//  UIView
//
//  Created by pantosoft on 2017/8/1.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class GeometryView: UIView {
    var layoutTimes = 0
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
    }
    
    //当view的frame确定之后会调用该方法,可以在这个方法里面对subView做精确的布局, 一般不直接调用该方法,通过setNeedsLayout来强制重新布局subviews,或者通过layoutIfNeeded在需要重新布局subview的时候,再去调用该方法
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutTimes += 1
        print(#function,layoutTimes, frame, bounds, transform, center)
    }
}
