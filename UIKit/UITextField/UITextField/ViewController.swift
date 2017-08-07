//
//  ViewController.swift
//  UITextField
//
//  Created by pantosoft on 2017/8/7.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var centerTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //UITextField:用于输入一行文字的控件(不支持多行文字的输入)
        //1.获取和设置textField的text
        topTextField.text = "textField"
        //2.获取和设置textField的富文本
        topTextField.attributedText = NSAttributedString(string: "attributeTextField", attributes: [NSForegroundColorAttributeName: UIColor.red])
        //3.设置textField的文字颜色
        topTextField.textColor = .darkGray
        //4.设置textField的文字字体
        topTextField.font = UIFont.boldSystemFont(ofSize: 17)
        //5.设置textField的对其方式. 默认为左对齐
        topTextField.textAlignment = .center
        //6.设置textField的边框样式,默认为none
        topTextField.borderStyle = .bezel
        //7.设置textAttributes
        topTextField.defaultTextAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]
        //8.设置placeholder
        topTextField.placeholder = "placeholder"
        //9.设置富文本placeholder
        topTextField.attributedPlaceholder = NSAttributedString(string: "attributePlaceholder", attributes: nil)
        //10.开始编辑的时候,是否清除掉之前的文字,默认为NO
        topTextField.clearsOnBeginEditing = true
        //11.是否自动适应textField的宽度,当文字宽度(通过设置的文字的font计算的结果)超过textField的宽度,会开始自动适应textField的宽度
        topTextField.adjustsFontSizeToFitWidth = true
        //12.设置当自动适应textField的宽度时,最小的文字大小
        topTextField.minimumFontSize = 10.0
        //13.设置textField的背景图片
//        topTextField.background = UIImage.image(forColor: .orange, size: CGSize(width: 1.0, height: 1.0))
        //14.设置textField disable状态下的背景图片
//        topTextField.disabledBackground = UIImage.image(forColor: .red, size: CGSize(width: 1.0, height: 1.0))
        //15.判断当前textField是不是在编辑状态
        print(topTextField.isEditing)
        //16.是否允许动态改变textAtrributes,默认为NO
        topTextField.allowsEditingTextAttributes = true 
        //17.输入状态下的textAttributes
        topTextField.typingAttributes = [NSForegroundColorAttributeName: UIColor.yellow]
        //18.设置清楚文字的button mode(只在text有值的情况下会显示).四种模式: 1.never:不显示清除text的按钮 2.whileEditing:编辑的时候显示清除文字的按钮 3.unlessEditing在非编辑状态下显示清除文字的按钮 4.always:一直显示清除文字的按钮.
        topTextField.clearButtonMode = .unlessEditing
        //19.
        topTextField.clearsOnInsertion = true
        //20.设置leftView和leftView的显示模式
        topTextField.leftViewMode = .always
        let leftView = UIView(frame: CGRect(x: 20, y: 0, width: 30, height: 20));
        leftView.backgroundColor = .red
        topTextField.leftView = leftView
        //21.设置rightView和rightView的显示模式
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30));
        rightView.backgroundColor = .blue
        topTextField.rightView = rightView
        topTextField.rightViewMode = .whileEditing
        //22.inputView和inputAccessoryView.inputView:默认为系统键盘,可以通过inputView来自定义键盘, inputAccessoryView:会出现在inputView上面
        let inputView = UIView(frame:CGRect(x: 100, y: 100, width: 100, height: 100));
        inputView.backgroundColor = .orange
        topTextField.inputView = inputView
        
        let inputAccessoryView = UIView(frame: CGRect(x: 20, y: 20, width: 50, height: 150))
        inputAccessoryView.backgroundColor = .red
        topTextField.inputAccessoryView = inputAccessoryView
        
        centerTextField.clearButtonMode = .whileEditing
        //UITextInput的一些操作
        //22.设置textField的键盘模式
        centerTextField.keyboardType = .asciiCapable
        //23.是否开启联想模式
        centerTextField.autocorrectionType = .no
        //24.设置returnkey Type
        centerTextField.returnKeyType = .join
        //25.开始保密显示
        centerTextField.isSecureTextEntry = true
        //26.监听textField的event事件
        //26.1 通过UIControl的target action模式来监听,可以监听所有的editing事件,也可以只监听某一个edit事件
        centerTextField.addTarget(self, action: #selector(textFieldEvent(_:)), for: .allEditingEvents)
        //26.2 通过通知来监听textField的事件,下面的三个通知事件
//        public static let UITextFieldTextDidBeginEditing: NSNotification.Name
//        public static let UITextFieldTextDidEndEditing: NSNotification.Name
//        public static let UITextFieldTextDidChange: NSNotification.Name
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldValueChanged(_:)), name: .UITextFieldTextDidChange, object: centerTextField)
        
        //26.3 通过delegate来监听textField的事件
        centerTextField.delegate = self
    
    }
    
    @objc private func textFieldEvent(_ textField: UITextField) {
        print(#line, #function)
    }
    
    @objc private func textFieldValueChanged(_ notification: NSNotification) {
        print(#line, #function)
    }
    
}

extension ViewController: UITextFieldDelegate {
    //1.是否允许textField开始编辑
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#line, #function)
        return true
    }
    //2.textField开始编辑的时候会触发
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#line, #function)
    }
    
    //3.是否允许textField结束编辑
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#line, #function)
        return true
    }
    //4.textField结束编辑的时候会触发
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#line, #function)
    }
    
    //5.textField结束编辑的时候会触发,iOS 10的新方法,可替代上面那个
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        print(#line, #function, reason.rawValue)
    }
    
    //6.是否允许替换字符串
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(#line, #function, range, string)
        return true
    }
    
    //7.clearButton点击的时候会触发
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#line, #function)
        return false
    }
    
    //8.returnKey点击的时候会触发
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#line, #function)
        return true
    }
}


extension UIImage {
    class func image(forColor color: UIColor, size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, true, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(CGRect(origin: .zero, size: size))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
