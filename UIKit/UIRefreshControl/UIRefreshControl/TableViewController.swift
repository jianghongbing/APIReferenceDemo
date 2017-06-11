//
//  TableViewController.swift
//  UIRefreshControl
//
//  Created by jianghongbing on 2017/5/26.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    private let cellIdentifier = "UIRefreshControl"
    private var rows = 5;
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: cellIdentifier)
        tableView.tableFooterView = UIView()
        //UIRefreshControl用于UITableViewController或者UICollectionViewController中,提供下拉刷新的功能
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor.blue
        refreshControl.attributedTitle = NSAttributedString(string: "下拉刷新")
        refreshControl.addTarget(self, action: #selector(pullToRefresh(_:)), for: .valueChanged)

//        addObserver(self, forKeyPath: "tableView.isDragging", options: [.old, .new], context: nil)

        self.refreshControl = refreshControl

    }
    // MARK: - Refresh Control action 
    func pullToRefresh(_ refreshControl: UIRefreshControl) {
//        print(refreshControl.isRefreshing)
//        tableView.isDragging

        if refreshControl.isRefreshing {
            refreshControl.attributedTitle = NSAttributedString(string: "松开刷新")
            rows = Int(arc4random() % UInt32(10))
            tableView.reloadData()

//            refreshControl.perform(#selector(@objc(endRefreshing)), with: nil, afterDelay: 2.0)

            let now = DispatchTime.now().rawValue

            let delay = __dispatch_time(now, Int64(1 * NSEC_PER_SEC))
            __dispatch_after(delay, DispatchQueue.main, {
                refreshControl.endRefreshing()
                refreshControl.attributedTitle = NSAttributedString(string: "下拉刷新")
            })


//            refreshControl.perform(#selector(endRefreshing), with: nil, afterDelay: 2.0)
//            refreshControl.endRefreshing()
        }
//        print(refreshControl.isRefreshing)




    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = "row:\(indexPath.row)"
        return cell
    }

    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        if !tableView.isDragging {
//            tableView.refreshControl?.endRefreshing()
//        }
    }

    // MARK: KVO
//    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        if keyPath == "tableView.isDragging" {
//            if let newValue = (change?[.newKey] as? Bool){
//                if newValue {
//                    if (tableView.refreshControl?.isRefreshing)! {
//                        tableView.refreshControl?.endRefreshing()
//                    }
//                }
//            }
//        }
//    }

    // MARK: dealloc 
    deinit {
//        removeObserver(self, forKeyPath: "tableView.isDragging")
    }
}
