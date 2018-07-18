//
//  TestViewTwo.swift
//  UINib
//
//  Created by pantosoft on 2018/7/18.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit

class TestViewTwo: UIView {
    @IBOutlet weak var aLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        print("func:\(#function),className:\(TestViewTwo.classForCoder())")
        backgroundColor = self.tintColor
        aLabel.textColor = .white
    }
}
