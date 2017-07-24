//
//  ViewController.swift
//  UIStepper
//
//  Created by pantosoft on 2017/7/24.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topStepper: UIStepper!
    @IBOutlet weak var centerStepper: UIStepper!
    @IBOutlet weak var bottomStepper: UIStepper!
    @IBOutlet weak var valueLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //UIStepper:用于增加和减少数值
        //1.设置tintColor
        topStepper.tintColor = .orange
        //2.是否不停的发送value change事件,当按住+ -按钮的时候
        topStepper.isContinuous = true
        bottomStepper.isContinuous = false
        //3.设置stepper的最大值和最小值
        topStepper.minimumValue = 5.0
        topStepper.maximumValue = 20.0
        //4.是否重复,当value到最大值的时候,又从minimumValue开始,默认为false,当value达到最大值或者最小值的时候,增加或者减少的按钮不可点击
        topStepper.wraps = true
        //5.当用户按住+ -按钮不放的时候,是否自动重复改变stepper的value. 默认为true
        topStepper.autorepeat = false
        //6.每一步改变值得大小,默认为1.0
        topStepper.stepValue = 2.0;
        //7.设置背景图片
        centerStepper.minimumValue = 1.0
        centerStepper.maximumValue = 10.0
        let normalBackgroundImage = UIColor.createImage(.red, CGSize(width: 10, height: 10))
        let disableBackgroundImage = UIColor.createImage(.gray, CGSize(width: 10, height: 10))
        let highLightedBackgroundImage = UIColor.createImage(.orange, CGSize(width: 10, height: 10))
        centerStepper.setBackgroundImage(normalBackgroundImage, for: .normal)
        centerStepper.setBackgroundImage(disableBackgroundImage, for: .disabled)
        centerStepper.setBackgroundImage(highLightedBackgroundImage, for: .highlighted)
        //8.设置加减按钮的背景图片
        let redImage = UIColor.createImage(.red, CGSize(width: 50, height: 30));
        let blueImage = UIColor.createImage(.blue, CGSize(width: 50, height: 30));
        let grayImage = UIColor.createImage(.gray, CGSize(width: 50, height: 30));
        
        bottomStepper.tintColor = .orange
        
        bottomStepper.minimumValue = 1.0
        bottomStepper.maximumValue = 10.0
        bottomStepper.setIncrementImage(redImage, for: .normal)
        bottomStepper.setIncrementImage(grayImage, for: .disabled)
        bottomStepper.setDecrementImage(blueImage, for: .normal)
        bottomStepper.setDecrementImage(grayImage, for: .disabled)
        //9.设置中间分割线的图片
        let dividerImage = UIColor.createImage(.blue, CGSize(width: 5.0, height: 35))
        let dividerImageOne = UIColor.createImage(.yellow, CGSize(width: 5.0, height: 10.0))
        bottomStepper.setDividerImage(dividerImage, forLeftSegmentState: .normal, rightSegmentState: .normal)
        bottomStepper.setDividerImage(dividerImageOne, forLeftSegmentState: .highlighted, rightSegmentState: .normal)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        self.valueLabel.text = "\(sender.value)"
    }
    
}

extension UIColor {
    class fileprivate func createImage(_ fromColor: UIColor, _ size: CGSize)  ->  UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(fromColor.cgColor)
        context?.fill(CGRect(origin: .zero, size: size))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image?.withRenderingMode(.alwaysOriginal)
    }
}

