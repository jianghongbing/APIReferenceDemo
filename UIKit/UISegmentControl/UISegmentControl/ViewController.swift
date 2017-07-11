//
//  ViewController.swift
//  UISegmentControl
//
//  Created by pantosoft on 2017/7/11.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topSegmentControl: UISegmentedControl!
    @IBOutlet weak var centerSegmentControl: UISegmentedControl!
    @IBOutlet weak var bottomSegmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //UISegmentControl:分段控件,只能同时显示文字或者图片,不同既显示文字又显示图片
        //1.是否短暂提示某一段被选中,默认为false,当为false,某一段被选中后,会以后选中的状态呈现,如果为ture,只会短暂的显示一下,然后又恢复之前的状态
        topSegmentControl.isMomentary = true
        //2.segment的数量
        let numberOfSegment = topSegmentControl.numberOfSegments
        print(numberOfSegment)
        //3.是否根据segment的内容来计算宽度,默认为false
        topSegmentControl.apportionsSegmentWidthsByContent = true
        //4.insert segment
        topSegmentControl.insertSegment(withTitle: "third Item", at: 2, animated: true)
        topSegmentControl.insertSegment(with: #imageLiteral(resourceName: "test.jpg"), at: 2, animated: true)
        //5.移除segment
        topSegmentControl.removeSegment(at: 2, animated: true)
//        topSegmentControl.removeAllSegments()
        //6.设置指定位置的segment的title
        topSegmentControl.setTitle("one item", forSegmentAt: 0)
        topSegmentControl.setTitle("two item", forSegmentAt: 1)
        //7.获取指定位置的segment的title
        if let title = topSegmentControl.titleForSegment(at: 1) {
            print("title:\(title)")
        }
        //8.设置指定位置的segment的width
        topSegmentControl.setWidth(80, forSegmentAt: 0)
        topSegmentControl.setWidth(100, forSegmentAt: 1)
        topSegmentControl.setWidth(120, forSegmentAt: 2)
        //9.获取指定位置的segment的width
        let segmentWidth = topSegmentControl.widthForSegment(at: 1)
        print(segmentWidth)
        //10.设置指定位置的segment的contentOffset内容的偏移量
        topSegmentControl.setContentOffset(CGSize(width: -10, height: -8), forSegmentAt: 1)
        topSegmentControl.setContentOffset(CGSize(width: 20, height: 8), forSegmentAt: 2)
        //11.获取指定segment的偏移
        let offset = topSegmentControl.contentOffsetForSegment(at: 1)
        print(offset)
        
        //12.设置指定位置的segment的enable状态
        topSegmentControl.setEnabled(false, forSegmentAt: 2)
        //13.获取指定位置的segmenet的enable状态
        let isEnable = topSegmentControl.isEnabledForSegment(at: 2)
        print(isEnable)
        //13.设置和获取选中的segment 
        bottomSegmentControl.selectedSegmentIndex = 1
        //14.设置tintColor
        bottomSegmentControl.tintColor = .orange
        //15.设置不同状态下的背景图片
        bottomSegmentControl.setBackgroundImage(#imageLiteral(resourceName: "test.jpg"), for: .normal, barMetrics: .default)
        bottomSegmentControl.setBackgroundImage(#imageLiteral(resourceName: "test1.jpg"), for: .selected, barMetrics: .default)
        //16.获取不同状态下的图片
        if let _ = bottomSegmentControl.backgroundImage(for: .normal, barMetrics: .default) {
            print("has background image")
        }else {
            print("no backgournd image")
        }
        //17.设置分割线的图片
        bottomSegmentControl.setDividerImage(UIImage.imageForColor(color: .red, imageSize: CGSize(width: 5, height: 20)), forLeftSegmentState: .normal, rightSegmentState: .selected, barMetrics: .default)
        bottomSegmentControl.setDividerImage(UIImage.imageForColor(color: .blue, imageSize: CGSize(width: 5, height: 20)), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        //18.获取分割线的图片
        if let _ = bottomSegmentControl.dividerImage(forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default) {
            print("has dividerImage for this state")
        }else {
            print("no dividerImage for this state")
        }
        
        //19.设置title的属性
        bottomSegmentControl.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.red], for: .normal)
        bottomSegmentControl.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.blue], for: .selected)
        
        //20.获取title的对应状态下的属性
        if let attributes = bottomSegmentControl.titleTextAttributes(for: .normal) {
            print(attributes)
        }else {
            print("no attributes")
        }
        
        //21.set content position adjust
        bottomSegmentControl.setContentPositionAdjustment(UIOffsetMake(10, 10), forSegmentType: .any, barMetrics: .default)
        //22.获取content position adjust 
        let positionAdjust = bottomSegmentControl.contentPositionAdjustment(forSegmentType: .any, barMetrics: .default)
        print(positionAdjust)
        
        //23.add target
        centerSegmentControl.addTarget(self, action: #selector(segmentControlValueChange(_:)), for: .valueChanged)
        
        //24.image segmentControl
        imageTypeSegmentControl()
    }
    
    @objc private func segmentControlValueChange(_ segmentControl: UISegmentedControl) {
        print(#function)
    }
    
    private func imageTypeSegmentControl() {
        let imageSegmentControl = UISegmentedControl(items: [#imageLiteral(resourceName: "test.jpg"), #imageLiteral(resourceName: "test1.jpg")])
        imageSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageSegmentControl)
        imageSegmentControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageSegmentControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    }
}

extension UIImage  {
    fileprivate class func imageForColor(color: UIColor?, imageSize: CGSize) -> UIImage? {
        guard !(color == nil || imageSize.width <= 0 || imageSize.height <= 0) else {
            return nil
        }
        UIGraphicsBeginImageContextWithOptions(imageSize, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color!.cgColor)
        context?.fill(CGRect(origin: .zero, size: imageSize))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
