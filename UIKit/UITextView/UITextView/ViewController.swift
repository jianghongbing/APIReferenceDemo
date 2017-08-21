//
//  ViewController.swift
//  UITextView
//
//  Created by jianghongbing on 2017/8/20.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topTextView: UITextView!
    @IBOutlet weak var bottomTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //UITextView:用于排版和显示文本
        topTextView.backgroundColor = .orange
        //1.delegate
        topTextView.delegate = self
        //2.获取和设置textView的文字
        topTextView.text = "https://www.apple.com\n027-88888888Testestsetesteststststststttestestestestststsetsetestes88888888Testestsetesteststststststttestestestestststsetsetestes88888888Testestsetesteststststststttestestestestststsetsetestes"
        //3.设置textView的文字颜色
        topTextView.textColor = .red
        //4.设置textView的字体
        topTextView.font = UIFont.boldSystemFont(ofSize: 15.0)
        //5.topTextView的对其方式
//        topTextView.textAlignment = .center
        //6.text的选中范围
//        topTextView.selectedRange = NSMakeRange(2, 10)
        //7.是否可编辑
//        topTextView.isEditable = false 
        //8.是否可以被选中
//        topTextView.isSelectable = false 
        //9.识别数据类型,如果text是可编辑的,该项没有效果,如果在不编辑状态,系统会识别text的类型,如链接,电话号码等
//        topTextView.dataDetectorTypes = .all
        
        //10.是否允许编辑
        topTextView.allowsEditingTextAttributes = false
        //11.设置topTextView的输入属性,建议在delegate方法中设置
        topTextView.typingAttributes = [NSForegroundColorAttributeName : UIColor.blue];
        //12.自定义topTextView的inputView默认为系统键盘
//        topTextView.inputView 
        //13.自定义textView的inputAccessoryView 
        let inputAccessoryView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 44))
        inputAccessoryView.backgroundColor = .orange
        topTextView.inputAccessoryView = inputAccessoryView
        
        //14.设置文本位置的内边距
        topTextView.textContainerInset = UIEdgeInsetsMake(10, 10, 10, 10)
        //15.当选中某段文字的时候,进行输入的时候,会清楚选中的文字
//        topTextView.clearsOnInsertion = true
        //16.滚动到指定range的文字的可见范围
        topTextView.scrollRangeToVisible(NSMakeRange(80, 20))
        
        //17.notification
        //text发生改变的通知
//        NotificationCenter.default.addObserver(self, selector: #selector(textDidChanged(_:)), name: .UITextViewTextDidChange, object: topTextView)
//        //开始编辑的时候的通知
//        NotificationCenter.default.addObserver(self, selector: #selector(textViewBeginEditing(_:)), name: .UITextViewTextDidBeginEditing, object: topTextView)
//        //结束编辑时候的通知
//        NotificationCenter.default.addObserver(self, selector: #selector(textViewEndEditing(_:)), name: .UITextViewTextDidEndEditing, object: topTextView)
        
        bottomTextView.text = "https://www.apple.com\n15623154687"
        bottomTextView.font = UIFont.boldSystemFont(ofSize: 16)
        bottomTextView.textColor = .orange
        bottomTextView.delegate = self
        bottomTextView.isEditable = false
        bottomTextView.dataDetectorTypes = .all
        
    }
    
//    deinit {
//        NotificationCenter.default.removeObserver(self)
//    }
//    
//    @objc func textDidChanged(_ notification: Notification) {
//        print(#line, #function)
//    }
//    
//    @objc func textViewBeginEditing(_ notification: Notification) {
//        print(#line, #function)
// 
//    }
//    
//    @objc func textViewEndEditing(_ notification: Notification) {
//        print(#line, #function)
//
//    }
}


extension ViewController : UITextViewDelegate {
    //1.是否允许开始编辑
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        print(#line, #function)
        return true
    }
    //2.textView开始编辑
    func textViewDidBeginEditing(_ textView: UITextView) {
        print(#line, #function)
    }
    
    //3.textView的text发生改变
    func textViewDidChange(_ textView: UITextView) {
        print(#line, #function)
        textView.typingAttributes = [NSForegroundColorAttributeName : UIColor.blue];
    }
    
    //4.是否允许结束编辑,当为flase的时候,键盘不会退下去
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        print(#line, #function)
        return true
    }
    
    //5.textView结束编辑
    func textViewDidEndEditing(_ textView: UITextView) {
        print(#line, #function)
    }
    
    //6.点击键盘的时候,就会触发该方法,可以根据当前输入的文字,进行一些更精确的操作
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        print(#line, #function)
        if text == "\n" {
          textView.resignFirstResponder()
        }
        return true 
    }
    
    //7.选中的位置放生改变的时候,会触发
    func textViewDidChangeSelection(_ textView: UITextView) {
        print(#line, #function)
        let selectedRange = textView.selectedRange
        print(NSStringFromRange(selectedRange))
        if let selectedString = (textView.text as NSString?)?.substring(with: selectedRange) {
            print("selectedString:" + selectedString);
        }
    }
    
    //8.当用户和textView的text被识别的URL交互是会触发该方法
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        print(#line, #function)
        if let scheme = URL.scheme, scheme == "https" {
            return true
        }
        return false
    }
    
    //8.是否允许交互(目前不是很了解)
    func textView(_ textView: UITextView, shouldInteractWith textAttachment: NSTextAttachment, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        print(#line, #function)
        return true
    }
}
