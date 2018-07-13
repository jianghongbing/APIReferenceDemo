//
//  TableViewController.swift
//  UIStoryboard
//
//  Created by pantosoft on 2018/7/10.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    //UIStoryboard相关api
    private let storyboardIdentifers = ["AViewController", "BViewController"]
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil) //获取某个storyboard
//        instantiateInitialViewController() -> UIViewController?, 获取最初的控制器
        let viewController = storyboard.instantiateViewController(withIdentifier: storyboardIdentifers[indexPath.row]) //获取storyboard中对应identifier的viewController
        navigationController?.pushViewController(viewController, animated: true)
    }

}
