//
//  UIViewController+Alert.swift
//  UIImagePickerController
//
//  Created by pantosoft on 2018/4/18.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit
extension UIViewController {
    func alert(with title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message:message, preferredStyle: .alert)
        let action = UIAlertAction(title: "确定", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}
