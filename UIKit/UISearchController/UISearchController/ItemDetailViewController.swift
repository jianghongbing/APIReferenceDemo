//
//  ItemDetailViewController.swift
//  UISearchController
//
//  Created by pantosoft on 2017/6/19.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {
    
    fileprivate var item: Item?
    @IBOutlet weak var itemNumberLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    convenience init(item: Item) {
        self.init(nibName: nil, bundle: nil)
        self.item = item
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let item = self.item {
            itemNumberLabel.text = item.itemNumber
            itemPriceLabel.text = "price:\(item.itemPrice)"
        }
    }

}
