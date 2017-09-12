//
//  ViewController.swift
//  UIResponder
//
//  Created by pantosoft on 2017/9/12.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let responder = UIResponder()
        //UIResponder:app事件的处理主要是通过响应者链来来传递.而能够传递和处理事件的类都继承与UIResponder
        //1.是否可以成为第一响应者,默认为flase,可以通过重写该方法返回true
        let canBecomeFirstResponder = self.canBecomeFirstResponder
        print(canBecomeFirstResponder)
        if canBecomeFirstResponder {
            //2.注册成为第一响应者
            let becomeFirstResponder = self.becomeFirstResponder()
            print("becomeFirstResponder:\(becomeFirstResponder)")
        }
        
        //3.是否可以辞去第一响应者, 默认为true
        let canResignFirstResponder = self.canResignFirstResponder
        
        //4.是否为第一响应者
        let isFirstResponder = self.isFirstResponder;
        print(canResignFirstResponder, isFirstResponder)
        
        if canResignFirstResponder && isFirstResponder {
            //5.辞去第一响应者
            let resignFirstResponder = self.resignFirstResponder();
            print("resignFirstResponder:\(resignFirstResponder)")
        }
        
        //6.获取下一个响应者
        if let nextResponder = self.next {
            print("nextResponder:\(nextResponder)")
        }
        
    }
}

