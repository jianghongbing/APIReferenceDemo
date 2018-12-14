//
//  WebViewController.swift
//  WKUIDelegate
//
//  Created by pantosoft on 2018/12/14.
//  Copyright © 2018 jianghongbing. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    var loadHTMLFromLocal = false
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
    }
    
    private func setupWebView() {
        webView.uiDelegate = self
        if loadHTMLFromLocal {
            let path = Bundle.main.path(forResource: "index", ofType: "html")
            let url = URL(fileURLWithPath: path!)
            webView.loadFileURL(url, allowingReadAccessTo: url)
        }else {
            let url = URL(string: "https://www.baidu.com")
            let request = URLRequest(url: url!)
            webView.load(request)
        }

    }
}

extension WebViewController: WKUIDelegate {
    
}
