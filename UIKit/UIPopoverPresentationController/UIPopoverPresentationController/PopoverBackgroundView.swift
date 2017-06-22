//
//  PopoverBackgroundView.swift
//  UIPopoverPresentationController
//
//  Created by pantosoft on 2017/6/20.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class PopoverBackgroundView: UIPopoverBackgroundView {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("not support initWithCoder to initialize")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = .orange
        backgroundColor = .clear
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(UIColor.orange.cgColor)
//        context?.setStrokeColor(UIColor.clear.cgColor)
        
        let path = UIBezierPath()
//        path.lineWidth = 3.0
//        path.lineCapStyle = .round
//        path.lineJoinStyle = .round
        path.move(to: CGPoint(x: rect.width * 0.5, y: 0))
        path.addLine(to: CGPoint(x: rect.width * 0.5 - PopoverBackgroundView.arrowBase() * 0.5, y:PopoverBackgroundView.arrowHeight()))
        path.addLine(to: CGPoint(x: rect.width * 0.5 + PopoverBackgroundView.arrowBase() * 0.5, y:PopoverBackgroundView.arrowHeight()))
        path.close()
//        let cornerRadius: CGFloat = 10
        
//        let contentRect = rect.rect(fromY: PopoverBackgroundView.arrowHeight())
//        path.append(UIBezierPath(roundedRect: contentRect, cornerRadius: cornerRadius))
//        path.close()
//        path.stroke()
        path.fill()
    }
    
    override func layoutSubviews() {
        debugPrint(frame)
    }
    
    override static func arrowBase() -> CGFloat {
        return 20
    }
    
    override static func contentViewInsets() -> UIEdgeInsets {
        return .zero
    }
    
    override static func arrowHeight() -> CGFloat {
        return 20
    }

     override var arrowDirection: UIPopoverArrowDirection {
        set {
            
        }
        get {
            return .up
        }
    }
    
    override var arrowOffset: CGFloat {
        set {
            
        }
        
        get {
            return 10
        }
    }
    
    override class var wantsDefaultContentAppearance: Bool {
        return false
    }
}



extension CGRect {
    func rect(fromX x: CGFloat) -> CGRect {
        return CGRect(x: x, y: 0, width: width - x, height: height)
    }
    
    func rect(fromY y: CGFloat) -> CGRect {
        return CGRect(x: 0, y: y, width: width, height: height - y)
    }
    
    func  rect(fromX x: CGFloat, fromY y: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width - x, height: height - y)
    }
}
