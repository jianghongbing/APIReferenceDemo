//
//  TouchEventViewController.swift
//  UIResponder
//
//  Created by pantosoft on 2017/9/12.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class TouchEventViewController: UIViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(#line, #function, #file)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(#line, #function, #file)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(#line, #function, #file)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(#line, #function, #file)
    }
    
//    override func touchesEstimatedPropertiesUpdated(_ touches: Set<UITouch>) {
//        
//    }
}
