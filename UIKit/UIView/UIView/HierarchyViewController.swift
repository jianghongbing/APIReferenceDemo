//
//  HierarchyViewController.swift
//  UIView
//
//  Created by pantosoft on 2017/9/11.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class HierarchyViewController: UIViewController {
    let redView = UIView()
    let blueView = UIView()
    let orangeView = UIView()
    let testLabel = UILabel()
    var purpleView : UIView?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setToolbarHidden(false, animated: true)

        redView.frame = CGRect(x: 100, y: 100, width: 100, height: 100);
        redView.backgroundColor = .red
        redView.tag = 1000
        view.addSubview(redView)
        
        blueView.frame = CGRect(x: 150, y: 150, width: 200, height: 200);
        blueView.backgroundColor = .blue
        blueView.tag = 10000
        view.addSubview(blueView)

        orangeView.frame = CGRect(x: 50, y: 400, width: 100, height: 100);
        orangeView.backgroundColor = .orange
        orangeView.tag = 100000
        view.addSubview(orangeView)
        
        let orangeSubview = UIView(frame: CGRect(x: 20, y: 20, width: 50, height: 50))
        orangeSubview.backgroundColor = .green
        orangeView.addSubview(orangeSubview)
        
        
        testLabel.frame = CGRect(x: 200, y: 400, width: 100, height: 100)
        testLabel.text = "hehe"
        testLabel.backgroundColor = .brown
        view.addSubview(testLabel)
        
        //1.判断某个view是不是某个view的后代
        var isDescendant = orangeView.isDescendant(of: view)
        print(isDescendant)
        isDescendant = orangeSubview.isDescendant(of: view)
        print(isDescendant)
        isDescendant = redView.isDescendant(of: blueView)
        print(isDescendant)
        
        //2.convert point & rect
        convertRectAndPoint()
        
        
        
    }
    
    fileprivate func convertRectAndPoint() {
        //1.将某个view中的point(以自己的左上角为(0,0))转化到另外一个view中该point的位置 
        //toPoint的计算方式 topoint.x = self.frame.origin.x + point.x - toView.frame.origin.x;
        //toPoint.y = self.frame.origin.y + point.y - toView.frame.origin.y;
        var toPoint = redView.convert(CGPoint(x: 20, y: 20), to: view)
        //2.将某个view中的point转化到该point在自己frame中的位置
        //fromPoint的计算方式 fromPoint.x = fromView.origin.x + point.x - self.frame.origin.x;
        //fromPoint.y = fromView.origin.y + point.y - self.frame.origin.y;
        var fromPoint = redView.convert(CGPoint(x: 20, y: 20), from: view)
        print(toPoint, fromPoint)
        toPoint = redView.convert(CGPoint(x: 20, y: 20), to: blueView)
        fromPoint = redView.convert(CGPoint(x: 20, y: 20), from: blueView)
        print(toPoint, fromPoint)
        
        //3.将以自己为坐标系(左上角为(0,0))的rect转化成以toView为坐标系中的rect
        //转换的过程中,size不变,origin的变化同point的转换相同
        let toRect = redView.convert(CGRect(x: 50, y: 50, width: 50, height: 50), to: orangeView)
        //4.将以fromView中的rect转化成自己为坐标系的rect
        let fromRect = redView.convert(CGRect(x: 50, y: 50, width: 50, height: 50), from: orangeView)
        print(toRect, fromRect)
        
    }
    
    @IBAction func sendViewToBack(_ sender: Any) {
        //1.将某个view移动到最上面
        view.bringSubview(toFront: blueView)
    }
    @IBAction func bringSubviewToFront(_ sender: Any) {
        //2.将某个view移动到最下面
        view.sendSubview(toBack: blueView)
    }
    @IBAction func exchangeHierarchy(_ sender: Any) {
        //3 交互两个view的index,并不表示index小的就显示在最下面,index大的就显示在最上面
        view.exchangeSubview(at: 0, withSubviewAt: 1)
    }
    @IBAction func insertView(_ sender: Any) {
        guard purpleView == nil else {
            return
        }
        purpleView = UIView(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
        purpleView?.backgroundColor = .purple
        //3.在某个subView的上面插入一个subView
        view.insertSubview(purpleView!, aboveSubview: redView)
        //4.在某个subView的下面插入一个subView
//        view.insertSubview(purpleView!, belowSubview: redView)
        //5.插入一个View在指定位置,index的范围必须为0到view的subviews的数量之间
//        view.insertSubview(purpleView!, at: 0)
    }

    @IBAction func sizeFit(_ sender: Any) {
        //1.返回某个view的fit size,自定view时,可重写该方法来返回合适的size.如果为可以根据内容计算出合适的size的时候,返回的就是根据内容计算的size
        let size = testLabel.sizeThatFits(testLabel.frame.size)
        print(size)
        //2.自动改为当前的size为sizeThatFits的size, origin不会改变,size自适应
        testLabel.sizeToFit()
        print(testLabel.frame)
    }

}
