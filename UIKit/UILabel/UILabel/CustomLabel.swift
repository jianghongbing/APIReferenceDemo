//
//  CustomLabel.swift
//  UILabel
//
//  Created by pantosoft on 2017/6/30.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        comminInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        comminInit()
    }
    
    private func comminInit() {
        //开启label的交互,接收响应事件
        isUserInteractionEnabled = true
        preferredMaxLayoutWidth = 100
        backgroundColor = .orange
        textColor = .white
        numberOfLines = 0
//        allowsDefaultTighteningForTruncation = true 
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        debugPrint("label touches began")
    }
    
    override func drawText(in rect: CGRect) {
//        super.drawText(in: rect)
        debugPrint("rect:\(rect)")
        if let labelText = (text as NSString?) {
           labelText.draw(in: CGRect(x: 0, y: 8, width: bounds.width - 10, height: bounds.width - 10), withAttributes: nil)
        }
    }
    //设置text显示的范围
//    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
//        debugPrint(bounds, numberOfLines)
//        
//        return CGRect(x: bounds.minX + 5, y: bounds.minY + 5, width: bounds.width - 10, height: bounds.width - 10)
//    }
}
