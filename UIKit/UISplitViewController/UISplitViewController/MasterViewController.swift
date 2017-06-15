//
//  MasterViewController.swift
//  UISplitViewController
//
//  Created by pantosoft on 2017/6/15.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    let colorNames: [(String,UIColor)] = [("red", .red), ("blue", .blue), ("green", .green), ("yellow", .yellow), ("gray", .gray), ("purple", .purple), ("orange", .orange)]
    let cellIdentifier = "MasterViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "masterViewController"
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: cellIdentifier)
        tableView.tableFooterView = UIView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "show", style: .plain, target: self, action: #selector(splitControlleShowVC(_:)))
    }
    
    func splitControlleShowVC(_ barButtonItem:UIBarButtonItem) {
        let colorViewController = ColorViewController()
        colorViewController.view.backgroundColor = UIColor(colorLiteralRed: Float(arc4random_uniform(255)) / 255.0, green: Float(arc4random_uniform(255)) / 255.0, blue: Float(arc4random_uniform(255)) / 255.0, alpha: 1.0)
//        show(colorViewController, sender: nil)
        splitViewController?.show(colorViewController, sender: nil)
//        showDetailViewController(colorViewController, sender: nil)
    }
    
    
    // #MARK UITableViewDelegate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = colorNames[indexPath.row].0
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let colorViewController = ColorViewController()
        
        let color = colorNames[indexPath.row]
        colorViewController.title = color.0
        colorViewController.view.backgroundColor = color.1
        let navigationController = UINavigationController(rootViewController: colorViewController)
        showDetailViewController(navigationController, sender: nil)
    }
}
