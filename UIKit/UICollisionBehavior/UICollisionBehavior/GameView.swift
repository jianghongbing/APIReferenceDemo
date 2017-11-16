//
//  GameView.swift
//  UICollisionBehavior
//
//  Created by pantosoft on 2017/11/16.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class GameView: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup() {
        backgroundColor = .white
        addBalls()
    }
    
    private func addBalls() {
        for i in 0 ..< 30 {
            let ball = Ball(withBallNumber: i)
            ball.translatesAutoresizingMaskIntoConstraints = false
            addSubview(ball)
            
        }
    }
    

}
