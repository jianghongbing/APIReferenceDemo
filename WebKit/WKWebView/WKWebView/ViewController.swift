//
//  ViewController.swift
//  WKWebView
//
//  Created by pantosoft on 2017/7/6.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController {
    @IBOutlet weak var reloadItem: UIBarButtonItem!
    @IBOutlet weak var goBackItem: UIBarButtonItem!
    @IBOutlet weak var goForwardItem: UIBarButtonItem!
    @IBOutlet weak var stopLoadingItem: UIBarButtonItem!
    enum KeyPathes: String {
        case estimatedProgress = "estimatedProgress"
        case isLoading = "isLoading"
        case canGoBack = "canGoBack"
        case canGoForward = "canGoForward"
    }
//    static let keyPathes:[KeyPathes] = [.estimatedProgress, .isLoading]
    let estimatedProgress = KeyPathes.estimatedProgress
    let isLoading = KeyPathes.isLoading
    let canGoBack = KeyPathes.canGoBack
    let canGoForward = KeyPathes.canGoForward
    
    
    
    lazy var webView: WKWebView = {
        let webView = WKWebView(frame: self.view.bounds)
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        self.view.addSubview(webView)
        self.view.insertSubview(webView, at: 0)
        return webView
    }()
    
    lazy var progressView: UIView = {
        let y = self.view.safeAreaInsets.top
        let progressView = UIView(frame: CGRect(x: 0, y: y, width: 0, height: 2.0))
        progressView.backgroundColor = self.view.tintColor
        self.view.addSubview(progressView)
        return progressView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        //判断webKit是否支持从某个scheme获取资源文件
        var canHandlesURLScheme = WKWebView.handlesURLScheme("http")
        print("canHandlesURLScheme:\(canHandlesURLScheme)")
        canHandlesURLScheme = WKWebView.handlesURLScheme("file")
        print("canHandlesURLScheme:\(canHandlesURLScheme)")
        
        //加载网络上的网页
        let url = URL(string: "https://www.apple.com")
        let request = URLRequest(url: url!)
        webView.load(request)
        //设置和获取用户代理
        webView.customUserAgent = "iOS-WebKit"
        //设置webView的导航代理
        webView.navigationDelegate = self
        //设置webView的uiDelegate
        webView.uiDelegate = self
        addKVOObservers()
        //加载网页字符串,将该字符串作为网页的内容
//        webView.loadHTMLString("<!DOCTYPE html><html><head><style>body{background:red; color:white; font-size: 40px}</style></head><body>加载HTML字符串作为WebView的内容</body></html>", baseURL: nil)
        updateBarButtonItemStatus()
        //是否允许通过手势来进行前进和后退
        webView.allowsBackForwardNavigationGestures = true
    }
    
    deinit {
        removeKVOObservers()
    }
    
    
    private func setupUI() {
        self.navigationController?.setToolbarHidden(false, animated: true)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "LogWebViewInfo", style: .plain, target: self, action: #selector(logWebViewInfo(_:)))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "LoadLocalHTML", style: .plain, target: self, action: #selector(loadLocalHTML(_:)))
    }
    
    @objc private func loadLocalHTML(_ barButtonItem: UIBarButtonItem) {
        let path = Bundle.main.path(forResource: "test", ofType: "html")
        let HTMLURL = NSURL.fileURL(withPath: path!)
        webView.loadFileURL(HTMLURL, allowingReadAccessTo: HTMLURL)
    }
    
    
    @objc private func logWebViewInfo(_ barButtonItem: UIBarButtonItem) {
        //webView关联的scrollView
        let scrollView = webView.scrollView
        print("scrollView:\(scrollView)")
        //获取webView的title
        if let title = webView.title {
            print("webViewTitle:\(title)")
        }
        //获取webView的url
        if let url = webView.url {
            print("webViewURL:\(url)")
        }
        //获取webView的customUserAgent用户代理
        if let userAgent = webView.customUserAgent {
            print("customUserAgent:\(userAgent)")
        }
        //服务端认证
        if let serverTrust = webView.serverTrust {
            print("serverTrust:\(serverTrust)")
        }
        //网页所有资源是否是通过加密链接获取的
        let hasOnlySecureContent = webView.hasOnlySecureContent
        print("hasOnlySecureContent:\(hasOnlySecureContent)")
        //是否允许通过手势来前进或者后退网页
        let allowsBackForwardNavigationGestures = webView.allowsBackForwardNavigationGestures
        print("allowsBackForwardNavigationGestures:\(allowsBackForwardNavigationGestures)")
        //获取web的前进后退列表,包括可前进可后退的网页记录,也包括当前页
        let backForwardList = webView.backForwardList
        print("backForwardList:\(backForwardList)")
        //是否允许通过3dtouch来预览网页,iOS9默认为false,iOS之后默认为true
        let allowsLinkPreview = webView.allowsLinkPreview
        print("allowsLinkPreView:\(allowsLinkPreview)")
    }
    
    
    private func addKVOObservers() {
        webView.addObserver(self, forKeyPath:estimatedProgress.rawValue, options: .new, context: nil)
        webView.addObserver(self, forKeyPath: isLoading.rawValue, options: .new, context: nil)
        webView.addObserver(self, forKeyPath: canGoBack.rawValue, options: .new, context: nil)
        webView.addObserver(self, forKeyPath: canGoForward.rawValue, options: .new, context: nil)
    }
    
    private func removeKVOObservers(){
        webView.removeObserver(self, forKeyPath: estimatedProgress.rawValue)
        webView.removeObserver(self, forKeyPath: isLoading.rawValue)
        webView.removeObserver(self, forKeyPath: canGoBack.rawValue)
        webView.removeObserver(self, forKeyPath: canGoForward.rawValue)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        if let aKeyPath = keyPath {
//            print("aKeyPath:\(aKeyPath)")
//        }
        if let aKeyPath = keyPath{
            if aKeyPath == "estimatedProgress" {
                updateProgressView()
            }else {
                updateBarButtonItemStatus()
            }
        }
    }
    
    private func updateProgressView() {
        var frame = progressView.frame
        if webView.estimatedProgress == 1.0 {
            progressView.isHidden = true
        }else {
            progressView.isHidden = false
            //estimatedProgress:webView加载的进度
            frame.size.width = UIScreen.main.bounds.width * CGFloat(webView.estimatedProgress)
            progressView.frame = frame
            progressView.layoutIfNeeded()
        }
    }
    
    private func updateBarButtonItemStatus() {
        goBackItem.isEnabled = webView.canGoBack
        goForwardItem.isEnabled = webView.canGoForward
        stopLoadingItem.isEnabled = webView.isLoading
        
    }
    
    
    @IBAction func reload(_ sender: Any) {
        webView.reload() //重新加载网页
//        webView.reloadFromOrigin()
    }
    @IBAction func back(_ sender: Any) {
        if webView.canGoBack { //是否可以后退
            webView.goBack() //后退到上一个网页
        }
    }
    @IBAction func forward(_ sender: Any) {
        if webView.canGoForward { //是否可以前进
            webView.goForward() //前进一个网页
        }
    }
    @IBAction func stop(_ sender: Any) {
        if webView.isLoading { //判断网页是否正在加载
            webView.stopLoading() //停止加载网页
        }
    }
    @IBAction func goto(_ sender: Any) {
        let backForwardList = webView.backForwardList
        let forwardList = backForwardList.forwardList
        if forwardList.count > 0 {
            webView.go(to: forwardList[0]) //跳转到指定界面
        }
    }
    @IBAction func excuteScripts(_ sender: Any) {
//        webView.evaluateJavaScript("let myDiv = document.getElementById(\"myDiv\");let p = document.createElement(\"p\");p.textContent = \"白日依山尽,黄河入海流;欲穷千里目,更上一层楼.\";myDiv.append(p);") {(obj, error) in
//            if let anObj = obj {
//                print("anObj:\(anObj)")
//            }else if let anError = error {
//                print("error:\(anError)")
//            }
//        }
        //执行脚本,执行完成的handler的参数,obj:执行脚本的结果,error:执行脚本是否出错
        webView.evaluateJavaScript("addP()") {(obj, error) in
            if let anObj = obj {
                print("anObj:\(anObj)")
            }else if let anError = error {
                print("error:\(anError)")
            }
        }
        
        //执行本地脚本
        webView.evaluateJavaScript("function addTwoNumber(a, b){ return a + b;}; addTwoNumber(5, 6);") { (result, error) in
            if error == nil {
                if let aResult = result {
                    print("result:\(aResult)")
                }
            }else {
                print("error:\(error!)")
            }
        }
    }
    @IBAction func snapShot(_ sender: Any) {
        webView.takeSnapshot(with: nil) { (image, error) in
            if let anImage = image {
                let viewController = ImageViewController(anImage)
                viewController.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }
}


extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.navigationItem.title = webView.title
    }
}

extension ViewController: WKUIDelegate {
    
}
