//
//  ViewController.swift
//  UILabel
//
//  Created by pantosoft on 2017/6/28.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var centerLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var fourthLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        //1.设置label显示的文字
        topLabel.text = "Top Label"
        //2.设置label的文字颜色
        topLabel.textColor = .gray
        //3.设置label的字体
        topLabel.font = UIFont.systemFont(ofSize: 20)
        //4.设置文字的阴影颜色
        topLabel.shadowColor = .red
        //5.设置文字的阴影偏移
        topLabel.shadowOffset = CGSize(width: 5, height: 5)
        
        centerLabel.text = "hello, world,1234567890123456789"
        //6.设置对齐方式
        centerLabel.textAlignment = .center
        //7.文字的截断方式
        centerLabel.lineBreakMode = .byTruncatingMiddle
        //8.设置label高亮状态下的文字颜色
        centerLabel.highlightedTextColor = .red
        //9.自动修改fontsize来适应label的宽度
        centerLabel.adjustsFontSizeToFitWidth = true
        //10.设置label最小自动缩小比例
        centerLabel.minimumScaleFactor = 0.5
        
        
        bottomLabel.text = "jianghongbingjianghongbing"
        //11.设置文字行数,默认为1,若为0则可以多行显示文字
        bottomLabel.numberOfLines = 0
        //12.设置自动布局时,最大的布局宽度
        bottomLabel.preferredMaxLayoutWidth = 80
        
        //13.设置基线适应,垂直方向
//        UIBaselineAdjustmentAlignBaselines默认，文本最上端与中线对齐。
        
//        UIBaselineAdjustmentAlignCenters, //文本中线与label中线对齐。
        
//        UIBaselineAdjustmentNone, //文本最低端与label中线对齐。
        centerLabel.backgroundColor = .orange
        centerLabel.baselineAdjustment = .alignCenters

        //14.当文字不能完全显示的情况,自动缩小字符之间间距
        fourthLabel.text = "hedfasddfasfadsfadsf"
        fourthLabel.backgroundColor = .orange
        fourthLabel.allowsDefaultTighteningForTruncation = true
        
        
        //15.设置当前label enable状态,默认为true,若为false,颜色会变淡,表示其处于不可用状态
        fourthLabel.isEnabled = false

    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: view)
            if centerLabel.frame.contains(location) {
                //设置label为高亮状态
                centerLabel.isHighlighted = true
            }else {
                centerLabel.isHighlighted = false
            }
        }
    }
    
}

