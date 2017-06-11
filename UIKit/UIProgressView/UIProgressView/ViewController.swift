//
//  ViewController.swift
//  UIProgressView
//
//  Created by jianghongbing on 2017/6/1.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var barProgressView: UIProgressView!
    @IBOutlet weak var defaultProgressView: UIProgressView!
    @IBOutlet weak var progressView: UIProgressView!
    let progress = Progress(totalUnitCount: 10)
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProgressView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(barProgressView.frame, defaultProgressView.frame)
//        barProgressView.subviews.forEach {
//            print($0.frame)
//        }
//        defaultProgressView.subviews.forEach {
//            print($0.frame)
//        }
    }

    private func setupProgressView() {
        //1.设置已经加载的进度的颜色
        barProgressView.progressTintColor = UIColor.red
        //2.设置没有被进度填充部分的颜色
        barProgressView.trackTintColor = UIColor.blue
        //3.设置progress view的进度,默认为0.5
//        barProgressView.setProgress(0.0, animated: false)
        barProgressView.progress = 0.0



        //设置进度条的图片和非填充区域的图片
        defaultProgressView.progressImage = createImage(UIColor.orange)
        defaultProgressView.trackImage = createImage(UIColor.black)
//        defaultProgressView.progressTintColor = UIColor.yellow
//        defaultProgressView.trackTintColor = UIColor.brown

        if #available(iOS 9.0, *) {
            //iOS 9.0之后,可以通过UIProgress来改变UIProgressView的进度
            progressView.observedProgress = progress
        }
    }

    private func createImage(_ color: UIColor) -> UIImage? {
        UIGraphicsBeginImageContext(CGSize(width: 1.0, height: 1.0))
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(CGRect(origin: .zero, size: CGSize(width: 1.0, height: 1.0)))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

    @IBAction func start(_ sender: UIButton) {

        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            barProgressView.setProgress(1.0, animated: true)
            defaultProgressView.setProgress(0.0, animated: true)
            progress.completedUnitCount = 10
        }else {
            barProgressView.setProgress(0.0, animated: true)
            defaultProgressView.setProgress(1.0, animated: true)
            progress.completedUnitCount = 0
        }

    }
}

