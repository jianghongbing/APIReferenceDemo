//
//  TableViewController.swift
//  UITableViewRowAction
//
//  Created by pantosoft on 2017/12/13.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    private let cellLabelTag = 1000
    private let cellIdentifier = "testCell"
    private let countOfRow = 20
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 60
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countOfRow
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        if let label = (cell.viewWithTag(cellLabelTag) as? UILabel) {
            label.text = "section:\(indexPath.section) row:\(indexPath.row)"
        }
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return false
//    }
    

    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //UITableViewAction:当cell向右滑动的时候,用户可在当前row上执行的操作
        //UITableViewAction的创建:style 样式,title:标题,action:点击button后的回调
        let deleteAction = UITableViewRowAction(style: .default, title: "删除") { (action, indexPath) in
            
        }
//        deleteAction.backgroundColor = UIColor.blue
//        deleteAction.
        let favouriteAction = UITableViewRowAction(style: .normal, title: "喜欢") { (action, indexPath) in
        
        }
        
        //设置背景毛玻璃效果
        favouriteAction.backgroundEffect = UIBlurEffect(style: .dark)
        
        let uninterestedAction = UITableViewRowAction(style: .destructive, title: "不感兴趣") { (action, indexPath) in
        
        }
        //设置action button的背景颜色
        uninterestedAction.backgroundColor = .orange
        return [deleteAction, favouriteAction, uninterestedAction]
    }
}

