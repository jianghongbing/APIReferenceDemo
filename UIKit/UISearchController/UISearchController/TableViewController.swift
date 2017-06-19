//
//  TableViewController.swift
//  UISearchController
//
//  Created by pantosoft on 2017/6/19.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

struct Item {
    let itemNumber:String
    let itemPrice: Int
    init(itemNumber: String, itemPrice: Int) {
        self.itemNumber = itemNumber
        self.itemPrice = itemPrice
    }
}


class TableViewController: UITableViewController, UISearchResultsUpdating, UISearchControllerDelegate, UISearchBarDelegate{
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
    }
    
    
    
    private func setupSearchController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let resultTableViewController = storyboard.instantiateViewController(withIdentifier: "resultTableViewController")
        searchController = UISearchController(searchResultsController: resultTableViewController)
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        
        // 是否dismiss search result view controller,当点击到search result view controller的背景视图,默认为true
        searchController.dimsBackgroundDuringPresentation = true
        // search result view Controller的背景视图的样式是否为昏暗的,默认为true
        searchController.obscuresBackgroundDuringPresentation = true
        // 是否隐藏导航栏,当search result view controller 出现的时候
        searchController.hidesNavigationBarDuringPresentation = true
        
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "请输入搜索的价格"
        searchController.searchBar.keyboardType = .numberPad
        
    }
    
    // #MARK: UITableViewDatasource && UITableViewDelegate
    
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
        searchController.searchBar.endEditing(true)
        let item = items[indexPath.row]
        pushDetailViewController(withItem: item)
    }
    
    private func pushDetailViewController(withItem item: Item) {
        let detailViewController = ItemDetailViewController(item: item)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    // #MARK: UISearchResultsUpdating
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
    
    
    
    
    // #MARK: UISearchControllerDelegate 
    
    
    // #MARK: UISearchBarDelegate 
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        searchBar.endEditing(true)
//    }
    
}
