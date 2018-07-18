//
//  ViewController.swift
//  UINib
//
//  Created by pantosoft on 2018/7/18.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func awakeFromNib() {
        super.awakeFromNib()
        print("func:\(#function),className:\(ViewController.classForCoder())")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //当视图是从UINib或者Storyboard中生成的时候,系统会发送awakeFromNib消息给视图
        //获取nib
        let nib = UINib(nibName: "TestView", bundle: nil)
        //获取nib里面的视图,返回一个数组,获取指定的view对应的文件
        if let testViewOne = nib.instantiate(withOwner: nib, options: nil).first as? TestView {
            testViewOne.frame = CGRect(x: 50, y: 100, width: view.bounds.width - 50 * 2, height: 80)
            testViewOne.autoresizingMask = [.flexibleWidth]
            view.addSubview(testViewOne)
        }
        
        //通过bundle来获取对应的视图和UINib的instantiate方法功能类似
        if let testViewTwo = Bundle.main.loadNibNamed("TestView", owner: nil, options: nil)?.last as? TestViewTwo {
            testViewTwo.frame = CGRect(x: 50, y: 200, width: view.bounds.width - 50 * 2, height: 80)
            testViewTwo.autoresizingMask = [.flexibleWidth]
            view.addSubview(testViewTwo)
        }
    }
    @IBAction func presentAViewControllerWithNib(_ sender: Any) {
        let nibViewController = NibViewController(nibName: "NibViewController", bundle: nil)
        present(nibViewController, animated: true, completion: nil)
    }
    @IBAction func presentAViewControllerWithoutNib(_ sender: Any) {
    }
    
    @IBAction func unwindToViewController(segue: UIStoryboardSegue) {
        segue.source.dismiss(animated: true, completion: nil)
    }
}

