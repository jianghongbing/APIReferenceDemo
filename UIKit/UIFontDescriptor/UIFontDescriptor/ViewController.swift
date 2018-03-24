//
//  ViewController.swift
//  UIFontDescriptor
//
//  Created by pantosoft on 2018/3/21.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //UIFontDescriptor:对UIFont的描述,里面包含UIFont的相关信息
        //1. UIFontDescriptor实例的构建
        //通过类方法来构建
        //创建特定style的字体描述符
        let fontDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .body)
        //2.获取UIFontDescriptor中相关属性
        let fontAttributes = fontDescriptor.fontAttributes //获取所有的该字体属性
        let matrix = fontDescriptor.matrix //获取矩阵
        fontAttributes.forEach { (attributeName, attributeValue) in
            print(attributeName, attributeValue)
        }
        let pointSize = fontDescriptor.pointSize //字体大小
        let postscriptName = fontDescriptor.postscriptName //附言
        let symbolicTraits = fontDescriptor.symbolicTraits //描述符的特征,用位掩码来表示
        print("matrix:\(matrix)\npointSize:\(pointSize)\npostscriptName:\(postscriptName)\nsymbolicTraits:\(symbolicTraits)")
        //3.UIFontDescriptor.AttributeName: 字体描述中的属性名称
        //通过自定属性名称来访问对应的值
        //cascadeList
        //characterSet: 字体集
        //face
        //family: 字体家族
        //featureSettings
        //fixedAdvance
        //matrix
        //name: 字体名称
        //size: 字体大小
        //symbolic
        //textStyle: 字体样式
        //traits: 特征集合
        //visibleName
        let attributeNames: [UIFontDescriptor.AttributeName] = [.cascadeList, .characterSet, .face, .family, .featureSettings, .fixedAdvance, .matrix, .name, .size, .symbolic, .textStyle, .traits, .visibleName]
        for attributeName in attributeNames {
            if let attributeValue = fontDescriptor.object(forKey: attributeName) {
                let attributeInfo = "\(attributeName):\(attributeValue)"
                print(attributeInfo)
            }
        }
        //4.当前描述符添加新的attribute,来创建新的描述符
//        var newFontDiscriptor = fontDescriptor.withFace(nil)
        var newFontDiscriptor = fontDescriptor.withSize(18)
//        newFontDiscriptor = fontDescriptor.withFamily(nil)
//        newFontDiscriptor = fontDescriptor.withSymbolicTraits([])
//        newFontDiscriptor = fontDescriptor.withMatrix(nil)
        let transform = CGAffineTransform.identity.rotated(by: CGFloat.pi * 0.25)
        newFontDiscriptor = fontDescriptor.addingAttributes([.matrix : transform, .size: 25, .traits: [UIFontDescriptor.TraitKey.weight: UIFont.Weight.bold]])
        self.label.backgroundColor = .red
        self.label.font = UIFont(descriptor: newFontDiscriptor, size: newFontDiscriptor.pointSize)
    }
}

