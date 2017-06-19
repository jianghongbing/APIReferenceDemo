//
//  TableViewController.swift
//  UISearchController
//
//  Created by pantosoft on 2017/6/19.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class Item: NSObject {
    let itemNumber:String
    let itemPrice: Int
    init(itemNumber: String, itemPrice: Int) {
        self.itemNumber = itemNumber
        self.itemPrice = itemPrice
    }
}


class TableViewController: UITableViewController, UISearchResultsUpdating, UISearchControllerDelegate, ResultTableViewControllerDelegate{
    let cellIdentifier = "cellIdentifier"
    lazy var items: [Item] = {
        var items = [Item]()
        for i in 1 ... 100 {
            let itemNumber = "number\(i)"
            let price = Int(arc4random_uniform(5) + 1) * i
            let item = Item(itemNumber: itemNumber, itemPrice: price)
            items.append(item)
        }
        return items
    }()
    
    
    var searchController: UISearchController!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "show", style: .plain, target: self, action: #selector(showSearchController(_:)))
    }
    
    func showSearchController(_ barButtonItem: UIBarButtonItem) {
        searchController.isActive = !searchController.isActive
    }
    
    private func setupSearchController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let resultTableViewController = storyboard.instantiateViewController(withIdentifier: "resultTableViewController") as! ResultTableViewController
        resultTableViewController.delegate = self
        searchController = UISearchController(searchResultsController: resultTableViewController)
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        
        // 是否dismiss search result view controller,当点击到search result view controller的背景视图,默认为true
        searchController.dimsBackgroundDuringPresentation = false
        // search result view Controller的背景视图的样式是否为昏暗的,默认为true
//        searchController.obscuresBackgroundDuringPresentation = true
        // 是否隐藏导航栏,当search result view controller 出现的时候
//        searchController.hidesNavigationBarDuringPresentation = true
        
        tableView.tableHeaderView = searchController.searchBar
//        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "请输入搜索的价格"
        searchController.searchBar.keyboardType = .numberPad
        
        definesPresentationContext = true

        
    }
    
    // MARK: UITableViewDatasource && UITableViewDelegate
    
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = items[indexPath.row]
        pushDetailViewController(withItem: item)
    }
    
    private func pushDetailViewController(withItem item: Item) {
        searchController.searchBar.endEditing(true)
        
//        if searchController.isActive {
//            searchController.isActive = false
//        }
        
        let detailViewController = ItemDetailViewController(item: item)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    // MARK: UISearchResultsUpdating
    func updateSearchResults(for searchController: UISearchController) {
        let searchBarText = searchController.searchBar.text
        if let searchText = searchBarText?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines), let price = Int(searchText) {
            let filteredItems = items.filter {
                return $0.itemPrice >= price
            }
            
            let resultTableViewController = searchController.searchResultsController as! ResultTableViewController
            resultTableViewController.items = filteredItems
            resultTableViewController.tableView.reloadData()
        }

    }
    
    // MARK: UISearchControllerDelegate
    //1. search controller将要呈现的时候,delegate会收到该消息
    func willPresentSearchController(_ searchController: UISearchController) {
        debugPrint(#function)
    }
    //2. search controller已经出现的时候,delegate会收到该消息
    func didPresentSearchController(_ searchController: UISearchController) {
        debugPrint(#function)
    }
    
    //3. search controller将要消失的时候会,delegate会收到该消息
    func willDismissSearchController(_ searchController: UISearchController) {
        debugPrint(#function)
    }
    
    //4. search controller已经消失的时候,delegate会收到该消息
    func didDismissSearchController(_ searchController: UISearchController) {
        debugPrint(#function)
    }
    
    //5. 通过search bar或者设置search controller的isActive属性来使search controller呈现出来,delegate会收到该消息
    func presentSearchController(_ searchController: UISearchController) {
        debugPrint(#function)
    }
    
    
    
    // MARK: ResultTableViewDelegate 
    func resultTableViewController(resultTableViewController: ResultTableViewController, didSelectedItem item: Item) {
        pushDetailViewController(withItem: item)
    }
    
}
