//
//  LifeCircleView.swift
//  UIView
//
//  Created by jianghongbing on 2017/8/6.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class LifeCircleView: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("func:\(#function), line:\(#line)")
    }


    override init(frame: CGRect) {
        super.init(frame: frame)
        print("func:\(#function), line:\(#line)")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        print("func:\(#function), line:\(#line)")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        print("func:\(#function), line:\(#line)")
    }

    override func draw(_ rect: CGRect) {
        print("func:\(#function), line:\(#line)")
    }

    override func updateConstraints() {
        super.updateConstraints()
        print("func:\(#function), line:\(#line)")
    }

    override func willMove(toWindow newWindow: UIWindow?) {
        print("func:\(#function), line:\(#line)")
    }

    override func willMove(toSuperview newSuperview: UIView?) {
        print("func:\(#function), line:\(#line)")
    }
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        print("func:\(#function), line:\(#line)")
    }


    override func willRemoveSubview(_ subview: UIView) {
        print("func:\(#function), line:\(#line)")
        super.willRemoveSubview(subview)
    }

    override func removeFromSuperview() {
        super.removeFromSuperview()
        print("func:\(#function), line:\(#line)")
    }



    deinit {
        print("func:\(#function), line:\(#line)")
    }

//    override func prepareForInterfaceBuilder() {
//        print("func:\(#function), line:\(#line)")
//    }

}
