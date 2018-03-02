//
//  DrawCurveView.swift
//  UIBezierPath
//
//  Created by pantosoft on 2018/3/2.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit

class DrawCurveView: UIView {
    override func draw(_ rect: CGRect) {
        UIColor.orange.setFill()
        UIColor.black.setStroke()
        //1.绘制一个椭圆
        var bezierPath = UIBezierPath(ovalIn: CGRect(x: 100, y: 100, width: 80, height: 100))
        bezierPath.lineWidth = 5.0
        bezierPath.fill()
        bezierPath.stroke()
        //2.绘制圆弧
        bezierPath = UIBezierPath(arcCenter: CGPoint(x: 250, y: 150), radius: 30, startAngle: 0, endAngle: CGFloat.pi * 4 / 3, clockwise: false)
        bezierPath.lineWidth = 5.0
        bezierPath.stroke()
        
        bezierPath = UIBezierPath()
        bezierPath.lineWidth = 5.0
        bezierPath.move(to: CGPoint(x: 200, y: 200))
        //3.绘制双曲线
        bezierPath.addQuadCurve(to: CGPoint(x: 400, y: 200), controlPoint: CGPoint(x: 350, y: 400))
        bezierPath.stroke()
        
        //4.绘制bezierPath
        bezierPath.move(to: CGPoint(x: 20, y: 400))
        bezierPath.addCurve(to: CGPoint(x: 300, y: 400), controlPoint1: CGPoint(x: 100, y: 300), controlPoint2: CGPoint(x: 200, y: 500))
        bezierPath.stroke()
        //5.翻转路径,返回一个路径,和之前的路劲是一样的,但会绘制是按照反方向绘制的
        bezierPath.removeAllPoints()
        bezierPath.addArc(withCenter: CGPoint(x: 300, y: 500), radius: 50, startAngle: 0, endAngle: CGFloat.pi * 0.5, clockwise: true)
        bezierPath.stroke()
        
        let reversePath = bezierPath.reversing()
        reversePath.lineWidth = 10
        reversePath.stroke()
        
        //6.路径的拼接
        bezierPath.removeAllPoints()
        reversePath.removeAllPoints()
        
        bezierPath.move(to: CGPoint(x: 20, y: 500))
        bezierPath.addQuadCurve(to: CGPoint(x: 100, y: 500), controlPoint: CGPoint(x: 60, y: 600))
        reversePath.move(to: CGPoint(x: 100, y: 500))
        reversePath.addQuadCurve(to: CGPoint(x: 300, y: 500), controlPoint: CGPoint(x: 250, y: 600))
        bezierPath.append(reversePath)
        bezierPath.close()
        bezierPath.fill()
        bezierPath.stroke()
    }
}
