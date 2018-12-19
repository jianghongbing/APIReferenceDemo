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
    private var previewElementInfo: WKPreviewElementInfo?
    @IBOutlet weak var webView: WKWebView!
    var loadHTMLFromLocal = false
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "remove", style: .plain, target: self, action: #selector(removeWebView(barButtonItem:)))
    }
    
    @objc private func removeWebView(barButtonItem: UIBarButtonItem) {
        if(webView.superview != nil) {
            webView.removeFromSuperview()
        }
    }
    
    private func setupWebView() {
        webView.uiDelegate = self
        webView.allowsLinkPreview = true
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
    //当在js中执行window.open方法时,该方法会被触发
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        print(#function, #line, navigationAction, windowFeatures)
        webView.load(navigationAction.request)
        return nil
//        let webView = WKWebView(frame: self.view.bounds, configuration: configuration)
//        return webView
    }
    
    //当js中执行window.close方法时,也就是关闭当前窗口的时候,该方法会被触发
    func webViewDidClose(_ webView: WKWebView) {
        print(#function, #line);
        navigationController?.popViewController(animated: true)
    }
    
    //webView通过js执行alert时,该方法会被回调. webView通过js执行alert时,默认是不会显示在webView上的,通过通过拦截该方法加一个原生的alert
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        print(#function, #line, message, frame)
        webViewAlert(with: nil, message: message, completionHandler: completionHandler)
    }
    
    //webView通过js执行comfirm方法时,该方法会被回调
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        print(#function, #line, message, frame)
        webViewConfirm(with: nil, message: message, completionHandler: completionHandler)
    }
    
    //webView通过js执行prompt时,该方法会被回调
    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        print(#function, #line, prompt, defaultText ?? "", frame)
        webViewInput(with: nil, message: prompt, defaultText: defaultText, completionHandler: completionHandler)
    }
    
    //是否允许预览链接的内容
    func webView(_ webView: WKWebView, shouldPreviewElement elementInfo: WKPreviewElementInfo) -> Bool {
        print(#function, #line, elementInfo)
        self.previewElementInfo = elementInfo
        return true
    }
    
    //提供一个controller来预览内容
    func webView(_ webView: WKWebView, previewingViewControllerForElement elementInfo: WKPreviewElementInfo, defaultActions previewActions: [WKPreviewActionItem]) -> UIViewController? {
        print(#function, #line, elementInfo, previewActions)
        var viewController: UIViewController? = nil
        if let url = elementInfo.linkURL {
            viewController = PreviewViewController(url: url)
        }
        return viewController
    }
    
    //提交预览的时候,会被回调
    func webView(_ webView: WKWebView, commitPreviewingViewController previewingViewController: UIViewController) {
        print(#function, #line, previewingViewController)
        self.navigationController?.pushViewController(previewingViewController, animated: true)
    }
    
    
}


extension UIViewController {
    func webViewAlert(with title:String?, message: String?, completionHandler: @escaping () -> Void ) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "确定", style: .default) { _ in
            completionHandler()
        }
        alertViewController.addAction(action)
        present(alertViewController, animated: true, completion: nil)
    }
    
    func webViewConfirm(with title: String?, message: String?, completionHandler: @escaping (Bool) -> Void) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "取消", style: .default) { _ in
            completionHandler(false)
        }
        let confirmAction = UIAlertAction(title: "确定", style: .default) { _ in
            completionHandler(true)
        }
        alertViewController.addAction(cancelAction)
        alertViewController.addAction(confirmAction)
        present(alertViewController, animated: true, completion: nil)
    }
    
    func webViewInput(with title: String?, message: String?, defaultText: String?, completionHandler: @escaping (String?) -> Void) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertViewController.addTextField(configurationHandler: nil)
        let textField = alertViewController.textFields?.first
        textField?.text = defaultText
        let cancelAction = UIAlertAction(title: "取消", style: .default) { _ in
            completionHandler(nil)
        }
        let confirmAction = UIAlertAction(title: "确定", style: .default) { _ in
            print(textField?.text ?? "姓名输入为空")
            completionHandler(textField?.text)
        }
        alertViewController.addAction(cancelAction)
        alertViewController.addAction(confirmAction)
        present(alertViewController, animated: true, completion: nil)
    }
}

