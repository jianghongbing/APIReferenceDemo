//
//  ControlEventHandler.swift
//  UIControl
//
//  Created by pantosoft on 2017/9/12.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class ControlEventHandler: NSObject {
    func controlTouchLocationChanged(_ control: UIControl) {
        print(#function, #line)
    }
    
    func controlTracking(_ control: UIControl) {
        print(#function, #line)
    }
}
