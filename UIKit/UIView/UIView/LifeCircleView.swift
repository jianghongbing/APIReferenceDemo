//
//  LifeCircleView.swift
//  UIView
//
//  Created by jianghongbing on 2017/8/6.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class LifeCircleView: UIView {
    //1.通过IB或者storyboard初始化的方式会调用该方法
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("func:\(#function), line:\(#line)")
    }
    
    //2.通过initWithFrame或者init的方式来创建view的方式会调用该方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("func:\(#function), line:\(#line)")
    }

    //3.通过IB或者storyboard初始化的方式会调用该方法
    override func awakeFromNib() {
        super.awakeFromNib()
        print("func:\(#function), line:\(#line)")
    }

    //4.当需要精确布局subViews的时候,可以重写该方法,此时view本身的frame信息已经被确定
    override func layoutSubviews() {
        super.layoutSubviews()
        print("func:\(#function), line:\(#line)")
    }

    //5.绘制view的时候,会调用该方法
    override func draw(_ rect: CGRect) {
        print("func:\(#function), line:\(#line)")
    }

    //6.更新约束
    override func updateConstraints() {
        super.updateConstraints()
        print("func:\(#function), line:\(#line)")
    }

    //7.view将要被添加到新的window上面的时候,会触发该方法
    override func willMove(toWindow newWindow: UIWindow?) {
        print("func:\(#function), line:\(#line)")
    }

    //8.view将要被添加到新的superView上的时候,会触发该方法
    override func willMove(toSuperview newSuperview: UIView?) {
        print("func:\(#function), line:\(#line)")
    }
    
    //9.已经添加到superView上的时候,会触发该方法
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        print("func:\(#function), line:\(#line)")
    }
    //10.将要移除subview的时候会触发该方法
    override func willRemoveSubview(_ subview: UIView) {
        print("func:\(#function), line:\(#line)")
        super.willRemoveSubview(subview)
    }
    //11.从superview上remove的时候会触发该方法
    override func removeFromSuperview() {
        super.removeFromSuperview()
        print("func:\(#function), line:\(#line)")
    }
    //12.dealloc 
    deinit {
        print("func:\(#function), line:\(#line)")
    }

//    override func prepareForInterfaceBuilder() {
//        print("func:\(#function), line:\(#line)")
//    }

}
