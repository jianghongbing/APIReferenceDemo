//
//  CustomSlider.swift
//  UISlider
//
//  Created by pantosoft on 2017/6/30.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class CustomSlider: UISlider {
    //自定义slider的样式
    override func minimumValueImageRect(forBounds bounds: CGRect) -> CGRect {
        return bounds
    }
    
    override func maximumValueImageRect(forBounds bounds: CGRect) -> CGRect {
        return bounds
    }
    
    override func thumbRect(forBounds bounds: CGRect, trackRect rect: CGRect, value: Float) -> CGRect {
        let width: CGFloat = 50.0
        let height: CGFloat = 50.0
        return CGRect(x: (bounds.width - width) * CGFloat(value), y: (bounds.height - height) * 0.5, width: width, height: height)
        
    }
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        return bounds
    }

}
