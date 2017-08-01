//
//  GeometryViewController.swift
//  UIView
//
//  Created by pantosoft on 2017/8/1.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class GeometryViewController: UIViewController {
    var redView: UIView?
    let originFrame = CGRect(x: 100, y: 100, width: 100, height: 100)
    let changedFrame = CGRect(x: 150, y: 100, width: 75, height: 125)
    var originBounds = CGRect.zero
    let changedBounds = CGRect(x: 0, y: 0, width: 75, height: 125)
    var originCenter = CGPoint.zero
    var changeCenter = CGPoint(x: 100, y: 100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let redView = GeometryView(frame: originFrame)
        originCenter = redView.center
        originBounds = redView.bounds
        view.addSubview(redView)
        self.redView = redView
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setToolbarHidden(false, animated: true)
    }
    
    //1.frame:用户固定view的位置和决定view的大小,view中的内容显示在一个矩形中.frame的origin部分是相对于superView来决定的,当frame发生改变后,会自动的调用layoutSubViews方法
    @IBAction func changeFrame(_ sender: Any) {
        if let testView = redView {
            if testView.frame.equalTo(originFrame) {
                testView.frame = changedFrame
            }else {
                testView.frame = originFrame
            }
        }
    }
    
    //2.bounds:绝对view的大小,origin部分相对于自己定位,所以默认总为{0,0},改变后,会影响frame的size的大小,会自动的调用layoutSubViews方法
    @IBAction func changeBounds(_ sender: Any) {
        if let testView = redView {
            if testView.bounds.equalTo(originBounds) {
                testView.bounds = changedBounds
            }else {
                testView.bounds = originBounds
            }
        }
    }
    
    //3.center:也就是view的中心点相对于superView的位置,改变后会影响frame的位置,但是不会调用layoutSubView方法,因为subView相对于自己的位置并没有发生改变,因此不需要去重新计算subView的位置
    @IBAction func changeCenter(_ sender: Any) {
        if let testView = redView {
            if testView.center.equalTo(originCenter) {
                testView.center = changeCenter
            }else {
                testView.center = originCenter
            }
            print(testView.frame, testView.bounds, testView.center)
        }
    }
    
    //4.transform: view的2D形变属性,可以对view进行旋转,放大缩小,位移等动作,会改变frame的值,不会改变bounds和center的值,但是不会调用layoutSubView方法,因为subView相对于自己的位置并没有发生改变,因此不需要去重新计算subView的位置
    @IBAction func changeTransform(_ sender: Any) {
        if let testView = redView {
            if testView.transform == .identity {
//                testView.transform = CGAffineTransform(rotationAngle: CGFloat(Float.pi / 4.0))
//                testView.transform = CGAffineTransform(translationX: 100, y: 100)
                testView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            }else {
                testView.transform = .identity
            }
            print(testView.frame, testView.bounds, testView.center)
        }
    }
}
