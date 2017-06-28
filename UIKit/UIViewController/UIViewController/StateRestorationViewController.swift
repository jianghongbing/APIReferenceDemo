//
//  StateRestorationViewController.swift
//  UIViewController
//
//  Created by pantosoft on 2017/6/28.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class StateRestorationViewController: UIViewController {

    static let textEncodeKey = "restoreTextFieldText"
    
//    var text: String?
    
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
        debugPrint(#function)
        if let text = textField.text {
            debugPrint("text:" + text)
            coder.encodeConditionalObject(text, forKey: StateRestorationViewController.textEncodeKey)
        }
    }
    
    override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
        debugPrint(#function)
        if coder.containsValue(forKey: StateRestorationViewController.textEncodeKey) {
            if let obj = coder.decodeObject(forKey: StateRestorationViewController.textEncodeKey) {
                debugPrint(obj)
            }else {
                debugPrint("obj is nil")
            }
        }
    }
    
}
