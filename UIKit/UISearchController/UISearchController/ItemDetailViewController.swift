//
//  ItemDetailViewController.swift
//  UISearchController
//
//  Created by pantosoft on 2017/6/19.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {
    
    @IBOutlet weak var itemNumberLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    fileprivate var item: Item?
    required init?(coder aDecoder: NSCoder) {
        fatalError("use init(item:) to init")
    }
    init(item: Item) {
        super.init(nibName: "ItemDetailViewController", bundle: nil)
        self.item = item
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let newItem = item {
            itemNumberLabel.text = newItem.itemNumber
            itemPriceLabel.text = "price:\(newItem.itemPrice)"
        }
    }

}
