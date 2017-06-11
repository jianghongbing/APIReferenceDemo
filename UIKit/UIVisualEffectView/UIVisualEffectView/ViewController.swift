//
//  ViewController.swift
//  UIVisualEffectView
//
//  Created by jianghongbing on 2017/5/20.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //1.模糊效果的视图
    lazy var blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurvisualEffectView = UIVisualEffectView(effect: blurEffect)
        blurvisualEffectView.alpha = 1.0
        let subView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        subView.backgroundColor = UIColor.orange
        blurvisualEffectView.contentView.addSubview(subView)
        return blurvisualEffectView
    }()

    lazy var vibrancyEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
        let vibrancyEffecntView = UIVisualEffectView(effect: vibrancyEffect)
        vibrancyEffecntView.backgroundColor = UIColor.blue
        let subView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        subView.backgroundColor = UIColor.darkGray
        vibrancyEffecntView.contentView.addSubview(subView)
        return vibrancyEffecntView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addBlurEffect(_ sender: Any) {
        if view.subviews.contains(vibrancyEffectView) {
            vibrancyEffectView.removeFromSuperview()
        }else if view.subviews.contains(blurEffectView) {
            blurEffectView.removeFromSuperview()
        }else {
            blurEffectView.frame = view.bounds
            view.addSubview(blurEffectView)
        }
    }

    @IBAction func addVibrancyEffect (_ sender: Any) {
        if view.subviews.contains(blurEffectView) {
            blurEffectView.removeFromSuperview()
        }else if view.subviews.contains(vibrancyEffectView) {
            vibrancyEffectView.removeFromSuperview()
        }else {
            vibrancyEffectView.frame = view.bounds
            view.addSubview(vibrancyEffectView)
        }

    }
}

