//
//  CustomButton.swift
//  UIButton
//
//  Created by pantosoft on 2017/7/6.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    //重写下面的几个方法对button自定义
    private var index = 0
    override func backgroundRect(forBounds bounds: CGRect) -> CGRect {
        index += 1
        print(index, #function)
        return CGRect(x: bounds.minX, y: bounds.minY, width: bounds.width + 20, height: bounds.height + 20)
    }
    
    override func contentRect(forBounds bounds: CGRect) -> CGRect {
        index += 1
        print(index, #function)
        return bounds.insetBy(dx: 10, dy: 10)
    }
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        index += 1
        print(index, #function)
        return CGRect(x: 0, y: contentRect.height * 0.65, width: contentRect.width, height: contentRect.height * 0.35);
    }
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        index += 1
        print(index, #function)
        return CGRect(x: 0, y: 0, width: contentRect.width, height: contentRect.height * 0.65);
    }

}
