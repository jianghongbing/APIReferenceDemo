//
//  ViewController.swift
//  UIButton
//
//  Created by pantosoft on 2017/6/30.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var detailClosure: UIButton!
    @IBOutlet weak var infoLightButton: UIButton!
    @IBOutlet weak var infoDarkButton: UIButton!
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var centerButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var lastButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //1.button type:button的样式,分为系统样式和自定义样式,系统样式又分为多种.
        let buttonType = addButton.buttonType
        debugPrint(buttonType.rawValue)
        
        //2.tintColor:会影响文字和图片的颜色,默认继承自父类
        topButton.tintColor = .red
        
        topButton.backgroundColor = .orange
        //3.button内边距
        topButton.contentEdgeInsets = UIEdgeInsetsMake(8, 8, 8, 8)
        
        //4.高亮状态下的title阴影是否翻转,默认为false
        topButton.reversesTitleShadowWhenHighlighted = true
        
        //5.在高亮状态下是否显示触摸(有一个光晕显示在button上面),默认为false
        topButton.showsTouchWhenHighlighted = true
        
        //6.设置某个状态下的图片
        topButton.setImage(#imageLiteral(resourceName: "application_normal"), for: .normal)
        topButton.setImage(#imageLiteral(resourceName: "application_selected"), for: .highlighted)
        
        //7.设置图片内容的内边距
//        topButton.imageView?.backgroundColor = .white
        topButton.imageEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5)
        //8.设置标题的内边距
//        topButton.titleLabel?.backgroundColor = .white
        topButton.titleEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 0)
        
        //9.设置不同状态下的title
        centerButton.setTitle("button1", for: .normal);
        centerButton.setTitle("button2", for: .highlighted)
        //10.设置不同状态下的title的颜色
        centerButton.setTitleColor(.red, for: .normal)
        centerButton.setTitleColor(.blue, for: .highlighted)
        //11.设置背景图片
        centerButton.setBackgroundImage(#imageLiteral(resourceName: "homepage_selected"), for: .normal)
        centerButton.setBackgroundImage(#imageLiteral(resourceName: "addressbook_selected"), for: .highlighted)
        
        //12.设置attributeString 
        let string = "jianghongbing"
        let normalAttributeString = NSMutableAttributedString(string: string)
        let range = (string as NSString).range(of: "hong");
        normalAttributeString.addAttributes([NSForegroundColorAttributeName: UIColor.red], range: range)
        bottomButton.setAttributedTitle(normalAttributeString, for: .normal)
        
        //13.设置title的阴影颜色
        lastButton.setTitleShadowColor(.orange, for: .normal)
        lastButton.setTitleShadowColor(.red, for: .highlighted)
                
        //13.获取不同状态的值
//        let title = centerButton.title(for: .normal)
//        let image = centerButton.image(for: .normal)
//        let titleColor = centerButton.titleColor(for: .normal)
//        let titleShadowColor = centerButton.titleShadowColor(for: .normal)
//        let attributeString = bottomButton.attributedTitle(for: .normal)
//        let backgroundImage = centerButton.backgroundImage(for: .highlighted)
//        let currentImage = centerButton.currentImage
//        let currentTitle = centerButton.currentTitle
//        let currentTitleColor = centerButton.currentTitleColor
//        let currentAttributeTitle = centerButton.currentAttributedTitle
//        let currentBackgroundImage = centerButton.currentBackgroundImage
//        let currentTitleShadowColor = centerButton.currentTitleShadowColor
//        let titleLabel = centerButton.titleLabel
//        let imageView = centerButton.imageView
        
        lastButton.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
        customButton()
    }
    
    
    private func customButton() {
        let customButton = CustomButton(type: .custom)
        customButton.setImage(#imageLiteral(resourceName: "application_normal"), for: .normal)
        customButton.translatesAutoresizingMaskIntoConstraints = false
        customButton.backgroundColor = .orange
        customButton.setTitle("hehehe", for: .normal)
        view.addSubview(customButton)
        
        customButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        customButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        customButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        customButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    @objc private func buttonClicked(_ button: UIButton) {
        debugPrint(#function)
    }
}

