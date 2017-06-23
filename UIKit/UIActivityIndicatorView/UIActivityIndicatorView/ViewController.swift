//
//  ViewController.swift
//  UIActivityIndicatorView
//
//  Created by pantosoft on 2017/6/23.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var grayActivityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var whiteLargeActivityIndicatorView: UIActivityIndicatorView!
    
    @IBOutlet weak var whiteActivityIndicatorView: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //1. 设置activity indicator view的样式
        grayActivityIndicatorView.activityIndicatorViewStyle = .gray
        //2. 设置activity indicator view的color.会覆盖通过style时候系统设置的color
        grayActivityIndicatorView.color = .red
        //3. 动画停止时,自动异常
        grayActivityIndicatorView.hidesWhenStopped = true
        
        grayActivityIndicatorView.backgroundColor = UIColor.blue
        
        whiteLargeActivityIndicatorView.hidesWhenStopped = true
        
        
        
        grayActivityIndicatorView.startAnimating()
        whiteLargeActivityIndicatorView.startAnimating()
        whiteActivityIndicatorView.startAnimating()
        
    }
    
    @IBAction func startAnimation(_ sender: Any) {
        //4. 判断activity indicator view是否正在动画
        guard !whiteLargeActivityIndicatorView.isAnimating else {
            return
        }
        //5. 开启动画
        whiteLargeActivityIndicatorView.startAnimating()

    }
    
    @IBAction func stopAnimation(_ sender: Any) {
        if whiteLargeActivityIndicatorView.isAnimating {
            //6. 结束动画
            whiteLargeActivityIndicatorView.stopAnimating()
        }
    }
}

