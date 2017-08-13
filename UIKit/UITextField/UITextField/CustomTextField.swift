//
//  CustomTextField.swift
//  UITextField
//
//  Created by pantosoft on 2017/8/8.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    //1.设置borderRect
    override func borderRect(forBounds bounds: CGRect) -> CGRect {
//        let rect = super.borderRect(forBounds: bounds)
//        print(#line, #function, rect)
//        return rect
        return CGRect(x: bounds.minX + 10, y: bounds.minY, width: bounds.width - 20, height: bounds.height)
    }
    
    //2.设置textRect
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect
    }
    
    //3.设置placeholderRect
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.placeholderRect(forBounds: bounds)
        return rect
    }
    //4.设置leftViewRect
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.leftViewRect(forBounds: bounds)
        return rect
    }
    
    //5.设置rightViewRect
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.rightViewRect(forBounds: bounds)
        return rect
    }
    
    //6.设置clearButtonRect
    override func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.clearButtonRect(forBounds: bounds)
        return rect
    }
    
    //7.设置编辑区域
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect
    }
    
    //8.设置textField的placeholder时,会触发该方法
    override func drawText(in rect: CGRect) {
        print(#line, #function, rect)
        super.drawText(in: rect)
    }
    
    //9.直接设置textField的text而不是通过键盘输入的时候,会触发该方法
    override func drawPlaceholder(in rect: CGRect) {
        print(#line, #function, rect)
        super.drawPlaceholder(in: rect)
    }
    

}
