//
//  ColorView.swift
//  UIColor
//
//  Created by pantosoft on 2017/11/2.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class ColorView: UIView {
    private var stokeColor = UIColor.black
    var fillColor = UIColor.white {
        didSet {
            var red: CGFloat = 0.0, green: CGFloat = 0.0, blue: CGFloat = 0.0, alpha: CGFloat = 0.0
            fillColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            stokeColor = UIColor(red: 1 - red, green: 1 - green, blue: 1 - blue, alpha: alpha)
            setNeedsDisplay()
        }
    }
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        fillColor.setFill() //填充颜色
        stokeColor.setStroke() //描边颜色
//        stokeColor.set() //同时填充和描边
        context?.setLineWidth(10.0)
        context?.fill(rect)
        context?.stroke(rect)
    }


}
