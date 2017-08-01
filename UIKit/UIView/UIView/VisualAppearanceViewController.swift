//
//  VisualAppearanceViewController.swift
//  UIView
//
//  Created by pantosoft on 2017/7/31.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class VisualAppearanceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //UIView主要用来呈现app可视化的数据内容,和处理用户和app之间的交互
        //1.UIView的外观属性
        let appearanceView = UIView(frame:CGRect(x: 50, y: 100, width: 100, height: 100))
        view.addSubview(appearanceView)
        //1.1 设置背景色
        appearanceView.backgroundColor = .red
        //1.2 设置透明度
        appearanceView.alpha = 0.5
        //1.3 是否不透明,默认为true
//        appearanceView.isOpaque = false
        //1.4 是否隐藏该view,默认为false
//        appearanceView.isHidden = true
        
        //1.5 是否裁剪掉subView超出本身的部分
        let blueView = UIView(frame: CGRect(x: 100, y: 250, width: 100, height: 100))
        blueView.backgroundColor = .blue
        view.addSubview(blueView)
        let blueSubview = UIView(frame: CGRect(x: 50, y: 50, width: 100, height: 30))
        blueSubview.backgroundColor = .orange
        blueView.addSubview(blueSubview)
        blueView.clipsToBounds = true
        
        //1.6 mask view,遮罩:会将maskView的alpha投射到view上,形成一种视觉效果,而且view只会显示与maskView重叠的部分
        let maskView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 150))
        maskView.backgroundColor = .red
        maskView.alpha = 0.5
        blueView.mask = maskView

        //1.7 设置tintColor,subView会从superView继承tintColor去渲染subView中的某些属性,如果UIBarButtonItem,UISwitch,UIButton等
        view.tintColor = .red
//        let tintColorView = UIView(frame: CGRect(x: 200, y: 100, width: 100, height: 100))
//        tintColorView.backgroundColor = .orange
//        tintColorView.tintColor = .red
//        view.addSubview(tintColorView)
        let stepper = UIStepper(frame: CGRect(x: 50, y: 400, width: 50, height: 30))
        view.addSubview(stepper)
//        tintColorView.addSubview(stepper)
        
        //1.8. 设置tintColor的适应模式 1.automatic:自动适应 2.normal 一般模式,3.dimmed暗淡模式
//        tintColorView.tintAdjustmentMode = .automatic
//        view.tintAdjustmentMode = .automatic
//        view.tintAdjustmentMode = .normal
        view.tintAdjustmentMode = .dimmed
        
        //1.9 可以重写tintColorDidChange()来监听tintColorchanged
        
        //1.3 opaque 如果opaque设置为YES，绘图系统会将view看为完全不透明，这样绘图系统就可以优化一些绘制操作以提升性能。如果设置为NO，那么绘图系统结合其它内容来混合处理view
        let opaqueView = UIView(frame: CGRect(x: 100, y: 450, width: 100, height: 50))
//        opaqueView.isOpaque = false
        opaqueView.backgroundColor = .red
        view.addSubview(opaqueView)
        let opaqueSubview = UIView(frame: CGRect(x: 10, y: 10, width: 50, height: 50))
//        opaqueSubview.backgroundColor = .blue
        opaqueSubview.isOpaque = false
//        opaqueSubview.alpha = 0.5
        opaqueView.addSubview(opaqueSubview)
    }
    @IBAction func changeTintColor(_ sender: Any) {
        view.tintColor = UIColor(colorLiteralRed: Float(arc4random_uniform(255)) / 255.0, green: Float(arc4random_uniform(255)) / 255.0, blue: Float(arc4random_uniform(255)) / 255.0, alpha: 1.0)
//        view.tintColor = .blue
    }
}
