//
//  TableViewController.swift
//  UIAlertController
//
//  Created by pantosoft on 2017/7/25.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let alertController = UIAlertController(title: "alert", message: "this is an alert", preferredStyle: .alert)
            let actionOne = UIAlertAction(title: "cancel", style: .cancel, handler: {
                print("cancel:\($0)")
            })
            let actionTwo = UIAlertAction(title: "confirm", style: .default, handler: {
                print("confirm:\($0)")
            })
            
            let actionThree = UIAlertAction(title: "three", style: .destructive, handler: nil)
            alertController.addAction(actionOne)
            alertController.addAction(actionTwo)
            alertController.addAction(actionThree)
            present(alertController, animated: true, completion: nil)
        case 1:
            let alertController = UIAlertController(title: "actionSheet", message: "this is an actionSheet", preferredStyle: .actionSheet)
            let actionOne = UIAlertAction(title: "one", style: .cancel, handler: {
                print("\($0.title ?? "One"):\($0)")
            })
            let actionTwo = UIAlertAction(title: "two", style: .default, handler: {
                print("\($0.title ?? "Two"):\($0)")
            })
            let actionThree = UIAlertAction(title: "three", style: .destructive, handler: {
                print("\($0.title ?? "Three"):\($0)")
            })
            alertController.addAction(actionOne)
            alertController.addAction(actionTwo)
            alertController.addAction(actionThree)
            present(alertController, animated: true, completion: nil)
        case 2:
            let alertController = UIAlertController(title: "textInput", message: "inputText", preferredStyle: .alert)
            let actionOne = UIAlertAction(title: "cancel", style: .cancel, handler: {
                print("cancel:\($0)")
            })
            actionOne.isEnabled = false;
            let actionTwo = UIAlertAction(title: "confirm", style: .default, handler: {
                print("confirm:\($0)")
                if let text = alertController.textFields?.first?.text {
                    print("input text:\(text)")
                }
            })
            alertController.addTextField(configurationHandler: {
                $0.placeholder = "输入文字"
                $0.addTarget(self, action: #selector(self.textFiledValueChanged(_:)), for: .editingChanged)
            })
            alertController.addAction(actionOne)
            alertController.addAction(actionTwo)
            present(alertController, animated: true, completion: nil)
        default:
            break
        }
    }
    
    @objc private func textFiledValueChanged(_ textField: UITextField) {
        if let text = textField.text {
            print("text:\(text)")
        }
    }
}
