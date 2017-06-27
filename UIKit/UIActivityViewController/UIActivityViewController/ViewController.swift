//
//  ViewController.swift
//  UIActivityViewController
//
//  Created by pantosoft on 2017/6/21.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func show(_ sender: Any) {
        let name = "jianghongbing"
        let url = URL(string: "https://www.jianghongbing.com")
        
        //1.activityViewController的初始化,activityItems:会将其中的值,发送给执行的activity,activityItem,可以为字符串,URL,图片等,也可以自定义activityItem. applicationActivities: 在controller中显示的activity的集合,如果为nil,则显示所有符合条件的activities.
        let activityViewController = UIActivityViewController(activityItems: [name, url ?? ""], applicationActivities: nil)
        activityViewController.modalPresentationStyle = .popover
        
        //2.执行完后的回调
        activityViewController.completionWithItemsHandler = {(activityType: UIActivityType?, completed: Bool, returnedItems: [Any]?, activityError: Error?) in
            debugPrint(activityType ?? "", completed, returnedItems ?? "", activityError ?? "")
        }
     
        //3.设置不想分享或者操作的activity
        activityViewController.excludedActivityTypes = [.airDrop, .postToFacebook, .postToVimeo, .postToWeibo, .postToTencentWeibo, .addToReadingList, .copyToPasteboard, .mail]

        present(activityViewController, animated: true, completion: nil)
    }
}

