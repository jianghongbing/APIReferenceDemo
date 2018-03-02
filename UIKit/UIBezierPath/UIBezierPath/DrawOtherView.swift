//
//  DrawOtherView.swift
//  UIBezierPath
//
//  Created by pantosoft on 2018/3/2.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit

class DrawOtherView: UIView {
    private var touchablePath: UIBezierPath = UIBezierPath()
    var path: UIBezierPath {
        return touchablePath
    }
    
    override func draw(_ rect: CGRect) {
        UIColor.orange.setFill()
        UIColor.black.setStroke()
        touchablePath = UIBezierPath(rect: rect.offsetBy(dx: 50, dy: 100))
        touchablePath.addClip()
        touchablePath.fill()
        touchablePath.stroke()
    }
}
