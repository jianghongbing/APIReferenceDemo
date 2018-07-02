//
//  ShortcutItemViewController.swift
//  UIApplicationShortcutItem
//
//  Created by pantosoft on 2018/7/2.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit

class ShortcutItemViewController: UIViewController {
    var shortcutItem: UIApplicationShortcutItem? {
        willSet(newValue) {
            guard newValue == nil else { return }
            titleTextField.text = newValue?.localizedTitle
            subtitleTextField.text = newValue?.localizedSubtitle
            descriptionLabel.text = newValue?.itemDescription
            titleTextField.isEnabled = newValue!.isDynamicItem
            subtitleTextField.isEnabled = newValue!.isDynamicItem
            navigationItem.rightBarButtonItem?.isEnabled = newValue!.isDynamicItem
        }
    }
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var subtitleTextField: UITextField!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action:#selector(changeDynamicItemInfo(_:)))
        navigationItem.rightBarButtonItem?.isEnabled = false
        if let shortcutItem = self.shortcutItem {
            titleTextField.text = shortcutItem.localizedTitle
            subtitleTextField.text = shortcutItem.localizedSubtitle
            descriptionLabel.text = shortcutItem.itemDescription
            titleTextField.isEnabled = shortcutItem.isDynamicItem
            subtitleTextField.isEnabled = shortcutItem.isDynamicItem
            navigationItem.rightBarButtonItem?.isEnabled = shortcutItem.isDynamicItem
        }
    }
    
    @objc private func changeDynamicItemInfo(_: UIBarButtonItem) {
        if let shortcutItem = self.shortcutItem, let dynamicShortcutItem = shortcutItem.mutableCopy() as? UIMutableApplicationShortcutItem {
            dynamicShortcutItem.localizedTitle = titleTextField.text ?? "标题不能为空"
            dynamicShortcutItem.localizedSubtitle = subtitleTextField.text
            var index: Int?
            if let dynamicShortcutItems = UIApplication.shared.shortcutItems {
                dynamicShortcutItems.enumerated().forEach { offset, shortcutItem in
                    if shortcutItem.type == dynamicShortcutItem.type {
                        index = offset
                    }
                }
                if let index = index {
                    UIApplication.shared.shortcutItems![index] = dynamicShortcutItem
                }
            }
        }
        
        navigationController?.popViewController(animated: true)
    }
}
