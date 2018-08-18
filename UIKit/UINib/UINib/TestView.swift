//
//  TestView.swift
//  UINib
//
//  Created by pantosoft on 2018/7/18.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit

class TestView: UIView {
    @IBOutlet weak var aLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        print("func:\(#function),className:\(TestView.classForCoder())")
        backgroundColor = .orange
        if let label = aLabel {
            label.textColor = .white
            label.font = UIFont.preferredFont(forTextStyle: .headline)
        }
    }
}
