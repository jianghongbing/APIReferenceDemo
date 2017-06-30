//
//  ViewController.swift
//  UISlider
//
//  Created by pantosoft on 2017/6/23.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topSlider: UISlider!
    @IBOutlet weak var centerSlider: UISlider!
    @IBOutlet weak var bottomSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        //1.设置最大值
        topSlider.maximumValue = 10.0
        //2.设置最小值
        topSlider.minimumValue = 0.0
        //3.设置当前值
        topSlider.value = 2.0
        //4.大于当前值的那边的进度条颜色
        topSlider.maximumTrackTintColor = .orange
        //5.小于当前值的那边的进度条颜色
        topSlider.minimumTrackTintColor = .red
        //6.设置滚动球的颜色
        topSlider.thumbTintColor = .blue
        //7.是否连续,默认为YES.就是在拖拽的过程中不断的改变值,不断发送valueChanged事件,若为NO,只在拖拽停止的时候,发送valueChanged事件
        topSlider.isContinuous = false
        //8.设置滚动球为图片
        centerSlider.setThumbImage(#imageLiteral(resourceName: "ball.png"), for: .normal)
        //9.设置大于当前值得那边的进度条的图片
        centerSlider.setMaximumTrackImage(#imageLiteral(resourceName: "max.jpg"), for: .normal)
        //10.设置小于当前值得那边的进度条的图片
        centerSlider.setMinimumTrackImage(#imageLiteral(resourceName: "min.jpg"), for: .normal)
        
        //11.获取当前状态的不同位置的图片
//        let minimumTrackImage = centerSlider.minimumTrackImage(for: .normal)
//        let thumbImage = centerSlider.currentThumbImage
//        let maximumTrackImage = centerSlider.maximumTrackImage(for: .normal)
        
        
        //12.custom image
        bottomSlider.setMinimumTrackImage(#imageLiteral(resourceName: "min.jpg"), for: .normal)
        bottomSlider.setMaximumTrackImage(#imageLiteral(resourceName: "max.jpg"), for: .normal)
        bottomSlider.setThumbImage(#imageLiteral(resourceName: "ball.png"), for: .normal)
        bottomSlider.setValue(0.2, animated: true)
        
        topSlider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
    }
    
    @objc private func sliderValueChanged(_ slider: UISlider) {
        debugPrint("value:\(slider.value)")
    }
}

