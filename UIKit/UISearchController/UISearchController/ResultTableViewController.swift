//
//  ResultTableViewController.swift
//  UISearchController
//
//  Created by pantosoft on 2017/6/19.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class ResultTableViewController: UITableViewController {
    
    var items = [Item]()
    let cellIdentifier = "resultTableViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = .init(rawValue: 0)
    }


    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.itemNumber
        cell.detailTextLabel?.text = "price:\(item.itemPrice)"
        return cell
    }
}
