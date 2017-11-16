//
//  Ball.swift
//  UICollisionBehavior
//
//  Created by pantosoft on 2017/11/16.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class Ball: UIView {
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = String(ballNumber)
        self.addSubview(label)
        return label
    }()
    let raduis:CGFloat = 30.0
    private var ballNumber = 0
    private var didUpdateConstraints = false
    convenience init(withBallNumber: Int) {
        self.init(frame: .zero)
        ballNumber = withBallNumber
        setup()
    }
    
    private func setup() {
        let red = CGFloat(arc4random()) / 225.0
        let green = CGFloat(arc4random()) / 225.0
        let blue = CGFloat(arc4random()) / 225.0
        self.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        layer.cornerRadius = raduis * 0.5
        clipsToBounds = true
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        if !didUpdateConstraints {
            label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            didUpdateConstraints = true
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: raduis, height: raduis)
    }
}
