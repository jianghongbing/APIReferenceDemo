//
//  ViewController.swift
//  WKNavigationDelegate
//
//  Created by pantosoft on 2018/12/12.
//  Copyright © 2018 jianghongbing. All rights reserved.
//

import UIKit
import WebKit
class WebViewController: UIViewController {
    var loadLocal = false
    lazy var webView: WKWebView = {
        let webView = WKWebView(frame: self.view.bounds)
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        webView.allowsLinkPreview = true
        self.view.addSubview(webView)
        return webView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setToolbarHidden(false, animated: true)
        if loadLocal {
            let path = Bundle.main.path(forResource: "index", ofType: "html")
            let fileURL = URL(fileURLWithPath: path!)
            webView.loadFileURL(fileURL, allowingReadAccessTo: fileURL)
        }else {
            let url = URL(string: "https://www.baidu.com")
            let request = URLRequest(url: url!)
            webView.load(request)
        }
    }

    @IBAction func loadLocalHTML(_ sender: Any) {
        
    }
    
    @IBAction func reload(_ sender: Any) {
        webView.reload()
    }
    @IBAction func goBack(_ sender: Any) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    @IBAction func goForward(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
}

//WKNavigationDelegate: 导航代理
extension WebViewController: WKNavigationDelegate {
    //当webView开始加载网页内容的时候,会被触发
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print(#function, #line, "navigation:\(navigation!)")
    }
    //当webView开始接收数据的时候,会被触发
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print(#function, #line, "navigaiton:\(navigation!)")
    }
    
    //当web发生重定向的时候,会被触发
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        print(#function, #line, "navigaiton:\(navigation!)")
    }
    
    
    
    //当网页需要鉴定的时候,会被触发
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        print(#function, #line, "challenge:\(challenge)")
        completionHandler(.useCredential, nil)
    }
    
    //在刚开始加载web就发送错误时,会被触发
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print(#function, #line, "navigaiton:\(navigation!)", "error:\(error)")
    }
    
    //在接收数据的时候发生错误,会被触发
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print(#function, #line, "navigaiton:\(navigation!)", "error:\(error)")
    }
    

    
    //在指定的navigation完成时,会被触发
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print(#function, #line, "navigaiton:\(navigation!)")
        navigationItem.title = webView.title
    }
    //在webConten处理进程结束的时候,会被触发
    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        print(#function, #line)
    }
    
    //在webView跳转网页之前,对指定的action是否进行导航
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        print(#function, #line, navigationAction)
        switch navigationAction.navigationType {
//        case linkActivated //带有herf的a标签的类型
//
//        case formSubmitted //表单提交
//
//        case backForward //通过历史记录后退或者前进
//
//        case reload //重新加载
//
//        case formResubmitted //重新提交表单
//
//        case other //其他
            //下面类型允许跳转
        case .linkActivated, .formSubmitted, .formResubmitted, .other:
            decisionHandler(.allow)
            //重新加载,前进或者后退不允许跳转
        case .backForward, .reload:
            decisionHandler(.cancel)
        }
    }
    
    //在获取响应后,决定是否跳转
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        print(#function, #line, navigationResponse)
        guard navigationResponse.isForMainFrame else {
            decisionHandler(.cancel)
            return
        }
        if let urlString = navigationResponse.response.url?.relativeString, urlString.contains("5.html"){
            decisionHandler(.cancel)
        }else {
            decisionHandler(.allow)
        }
        
//        navigationResponse.isForMainFrame ?  decisionHandler(.allow) : decisionHandler(.cancel)
    }

}
