//
//  ViewController.swift
//  UIColor
//
//  Created by pantosoft on 2017/11/1.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var colorView: ColorView!
    private var red: CGFloat = 0.0, green: CGFloat = 0.0, blue: CGFloat = 0.0,alpha: CGFloat = 1.0
    //    private var color: UIColor = .red
//    private var didUpdateConstraints = false
//    private lazy var colorView: UIView = {
//        let view = UIView()
//        view.backgroundColor = self.color
//        view.translatesAutoresizingMaskIntoConstraints = false
//        self.view.addSubview(view)
//        return view
//    }()
    
//    override func updateViewConstraints() {
//        super.updateViewConstraints()
//        guard !didUpdateConstraints else { return }
//        colorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        colorView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        colorView.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        colorView.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        didUpdateConstraints = true
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setNeedsUpdateConstraints()
        //UIColor:用于表示颜色
        let color = UIColor.red
        var white: CGFloat = 0.0, alpha: CGFloat = 0.0
        //1.获取white,alpha的值
        color.getWhite(&white, alpha: &alpha)
        print("white:\(white), alpha:\(alpha)")
        //2.获取红绿蓝,透明度的各个component的值
        var red: CGFloat = 0.0, green: CGFloat = 0.0, blue: CGFloat = 0.0
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        print("red:\(red), green:\(green), blue:\(blue). alpha:\(alpha)")
        //3.获取色彩度,饱和度,亮度等各个component的值
        var hue: CGFloat = 0.0, saturation:CGFloat = 0.0, brightness:CGFloat = 0.0
        color.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha);
        print("hud:\(hue),saturation:\(saturation),brightness:\(brightness)")
        //4.color的其他属性
//        let ciColor = color.ciColor
//        let cgColor = color.cgColor
        //5.color的常用初始化方法
//        var initColor = UIColor(ciColor: ciColor)
//        initColor = UIColor(cgColor: cgColor)
//        let initColor = UIColor(red: 0.5, green: 0.5, blue: 0.4, alpha: 0.8)
//        let initColor = UIColor(displayP3Red: 0.5, green: 0.5, blue: 0.4, alpha: 0.8)
//        colorView.backgroundColor = initColor
        
        
        
    }
    @IBAction func redValueChanged(_ sender: UISlider) {
        red = CGFloat(sender.value)
        let color = UIColor.init(red: red, green: green, blue: blue, alpha: alpha)
        colorView.fillColor = color

    }
    @IBAction func greenValueChanged(_ sender: UISlider) {
        green = CGFloat(sender.value)
        let color = UIColor.init(red: red, green: green, blue: blue, alpha: alpha)
        colorView.fillColor = color
    }
    @IBAction func blueValueChanged(_ sender: UISlider) {
        blue = CGFloat(sender.value)
        let color = UIColor.init(red: red, green: green, blue: blue, alpha: alpha)
        colorView.fillColor = color
    }
    @IBAction func alphaValueChanged(_ sender: UISlider) {
        alpha = CGFloat(sender.value)
        let color = UIColor.init(red: red, green: green, blue: blue, alpha: alpha)
        colorView.fillColor = color
    }
}

