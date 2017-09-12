//
//  PressEventTestView.swift
//  UIResponder
//
//  Created by pantosoft on 2017/9/12.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class PressEventTestView: UIButton {
    
    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        print("presses began");
        super.pressesBegan(presses, with: event)
    }
    
    override func pressesChanged(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        print("presses chaneged")
    }
    
    override func pressesCancelled(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        print("presses cancelled")
    }
    
    override func pressesEnded(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        print("presses ended")
    }

}
