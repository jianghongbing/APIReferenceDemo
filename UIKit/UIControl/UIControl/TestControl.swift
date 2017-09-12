//
//  TestControl.swift
//  UIControl
//
//  Created by pantosoft on 2017/9/12.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class TestControl: UIControl {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        //开始tracking
        beginTracking(touches.first!, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        //继续continue tracking
        continueTracking(touches.first!, with: event)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        //cancel tarcking
        cancelTracking(with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        //end tracking
        endTracking(touches.first!, with: event)
    }
}
