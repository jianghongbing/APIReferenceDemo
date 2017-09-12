//
//  TouchEventTestView.swift
//  UIResponder
//
//  Created by pantosoft on 2017/9/12.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class TouchEventTestView: UIView {
    
    //1.hisTest:获取处理event的第一响应者,如果返回nil,这将事件交给下一响应者处理
//    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
//        print(point)
//        if let touchEvent = event {
//            print(touchEvent)
//        }
//        if let nextResponder = self.next {
//            print(nextResponder)
//        }
//        return nil
//    }
    
    //touch event的方法:如果当前view没有处理该事件,就会将事件传递给nextResponder处理,依次传递,如果最后window没有处理,那么该事件将会被丢失,忽略
    //2.当开始触摸的时候,会调用该方法
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("TouchEventTestView touch began")
//        next?.touchesBegan(touches, with: event)
    }
    //3.当移动的时候,会调用该方法
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("TouchEventTestView touch moved")
        for touch in touches {
            print(touch)
        }
    }
    //4.当touch取消的时候(如有电话),会调用该方法
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {

        print("TouchEventTestView touch cancelled")
    }
    
    //5.当touch结束的时候,会调用该方法
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("TouchEventTestView touch end")
    }
}
