//
//  DrawLineView.swift
//  UIBezierPath
//
//  Created by pantosoft on 2018/3/2.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit

class DrawLineView: UIView {
    override func draw(_ rect: CGRect) {
        //UIBezierPath:表示一条路径,常用于绘图,以及CAShapeLayer和CAKeyframeAnimation中
        UIColor.red.setStroke()
        UIColor.orange.setFill()
        var bezierPath = UIBezierPath()
        //1.移动到某个点
        bezierPath.move(to: CGPoint(x: 10, y: 120))
        //2.添加一条线
        bezierPath.addLine(to: CGPoint(x: 110, y: 120))
        //3.设置线条的宽度
        bezierPath.lineWidth = 5.0
        //4.设置线条的两端的样式
        bezierPath.lineCapStyle = .round
        bezierPath.stroke()
        
        //5.移除掉所有点,相当于清空path
        bezierPath.removeAllPoints()
        //6.设置线条相交时的样式
        bezierPath.lineJoinStyle = .miter
        //斜接处的限制大小
        bezierPath.miterLimit = 8
        bezierPath.move(to: CGPoint(x: bounds.width * 0.5 - 100, y: 200))
        bezierPath.addLine(to: CGPoint(x: bounds.width * 0.5, y: 150))
        bezierPath.addLine(to: CGPoint(x: bounds.width * 0.5 + 100, y: 200))
        //7.描边
        bezierPath.stroke()
        
        //创建一个长方形的path
        bezierPath = UIBezierPath(rect: CGRect(x: 20, y: 220, width: 100, height: 100))
        bezierPath.lineWidth = 5.0
        bezierPath.lineJoinStyle = .round
        bezierPath.stroke()
        //创建一个长方形带有圆角的path
        bezierPath = UIBezierPath(roundedRect: CGRect(x: 130, y: 220, width: 100, height: 100), cornerRadius: 10)
        //8.填充
        bezierPath.fill()
        //创建一个长方形特定角为圆角的path
        bezierPath = UIBezierPath(roundedRect: CGRect(x: 250, y: 220, width: 100, height: 100), byRoundingCorners: [.topLeft, .bottomRight], cornerRadii: CGSize(width: 20, height: 20))
        bezierPath.fill()
        //9.绘制虚线
        bezierPath.removeAllPoints()
        bezierPath.move(to: CGPoint(x: 100, y: 350))
        bezierPath.addLine(to: CGPoint(x: 100, y: 450))
        bezierPath.addLine(to: CGPoint(x:300, y: 450))
        bezierPath.addLine(to: CGPoint(x: 300, y: 350))
        //10.关闭path
        bezierPath.close()
        bezierPath.lineWidth = 4.0
        let pattern: [CGFloat] = [10.0, 20.0, 30.0]
        //设置绘制虚线的规则
        //实线和空表线依次交替出现,长度对应着pattern中的长度,依次进行
        //phase:相位,决定了第一条线开始是实线还是空白线,长度为pattern中对应的值的剩余的值,如设置为20,说明第一条线为空白线,空白线的长度为10 + 20 - 20 = 10,如果为50,说明第一条线为实线,长度为10 + 20 + 30 - 50 = 10
        bezierPath.setLineDash(pattern, count: pattern.count, phase: 20)
        bezierPath.stroke()
        
        //11.获取虚线的pattern,count,phase
        var getPattern: [CGFloat] = Array(repeatElement(0.0, count: 10))
        var patternCount: Int = 0
        var patternPhase: CGFloat = 0
        bezierPath.getLineDash(&getPattern, count: &patternCount, phase: &patternPhase)
        getPattern.forEach {
            print("pattern:\($0)")
        }
        print(getPattern, patternCount, patternPhase)
        
    }
}
