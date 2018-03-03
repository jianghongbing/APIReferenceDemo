//
//  DrawOtherViewController.swift
//  UIBezierPath
//
//  Created by pantosoft on 2018/3/2.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit

class DrawOtherViewController: UIViewController {
    override func loadView() {
        view = DrawOtherView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //apply(_ transform: CGAffineTransform):将某个transform应用到当前Path
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let point = touch.location(in: view)
            let touchableView = view as! DrawOtherView
            let path = touchableView.path
            if path.contains(point) { //判断当前路径是否包含某个点
                print("touched touch enable area")
                //isEmpty:判断path是否为空,bounds:path的bounds,currentPoint:paht的当前点
                print("\(path.isEmpty),\(path.bounds), \(path.currentPoint) ")
            }
            
        }
    }


}
