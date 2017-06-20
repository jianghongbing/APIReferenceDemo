//
//  TableViewController.swift
//  UIPopoverPresentationController
//
//  Created by pantosoft on 2017/6/20.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

@objc protocol TableViewControllerDelegate {
    @objc optional func tableViewController(_ tableViewController: TableViewController, didSelectRowAt indexPath: IndexPath)
}

class TableViewController: UITableViewController {
    private let cellIdentifier = "tableViewCell"
    weak var delegate: TableViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: cellIdentifier)
        
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = "index:\(indexPath.row)"
        return cell
    }
    
    // MARK: - Table view delegate 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let _ = presentingViewController {
            dismiss(animated: true, completion: nil)
        }
        delegate?.tableViewController?(self, didSelectRowAt: indexPath)
    }


}
