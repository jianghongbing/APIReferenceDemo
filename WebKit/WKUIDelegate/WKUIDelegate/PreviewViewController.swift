//
//  PreviewViewController.swift
//  WKUIDelegate
//
//  Created by pantosoft on 2018/12/18.
//  Copyright © 2018 jianghongbing. All rights reserved.
//

import UIKit
import WebKit
class PreviewViewController: UIViewController {
    private let url: URL
    lazy var webView: WKWebView = {
        let webView = WKWebView(frame: self.view.bounds)
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(webView)
        return webView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("don't use this method to init PreviewViewController")
    }
    init(url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = URLRequest(url: url)
        self.webView.load(request)
    }
}

extension PreviewViewController {
    override var previewActionItems: [UIPreviewActionItem] {
        func createItem(with title: String, style: UIPreviewAction.Style, handler:@escaping (UIPreviewAction, UIViewController) -> Void) -> UIPreviewActionItem {
            let item = UIPreviewAction(title: title, style: style, handler: handler)
            return item
        }
        let itemOne = createItem(with: "前往", style: .default) { (action, viewController) in
            print("打开网页")
        }
        let itemTwo = createItem(with: "取消", style: .default) { (action, viewController) in
            print("取消打开网页")
        }
        return [itemOne, itemTwo]
    }
}
