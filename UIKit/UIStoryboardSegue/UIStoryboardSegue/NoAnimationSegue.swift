//
//  NoAnimationSegue.swift
//  UIStoryboardSegue
//
//  Created by pantosoft on 2018/7/13.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit

class NoAnimationSegue: UIStoryboardSegue {
    override func perform() {
        UIView.performWithoutAnimation {
            super.perform()
        }
    }
}
