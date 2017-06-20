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
        backgroundColor = .orange
    }
    
    override static func arrowBase() -> CGFloat {
        return 10
    }
    
    override static func contentViewInsets() -> UIEdgeInsets {
        return UIEdgeInsetsMake(5, 5, 5, 5)
    }
    
    override static func arrowHeight() -> CGFloat {
        return 10
    }
    
//    override var arrowDirection: UIPopoverArrowDirection {
//        set {
//            self.arrowDirection = newValue
//        }
//        get {
//            return super.arrowDirection
//        }
//    }
    
    override var arrowDirection: UIPopoverArrowDirection {
        set {
            super.arrowDirection = arrowDirection
        }
        
        get {
           return self.arrowDirection
        }
    }
    
    
//    override var arrowOffset: CGFloat {
//        set {
//            self.arrowOffset = newValue
//        }
//        
//        get {
//            return super.arrowOffset
//        }
//    }
    
    override class var wantsDefaultContentAppearance: Bool {
        return false
    }
}
