//
//  ViewController.swift
//  WKWebViewConfiguration
//
//  Created by pantosoft on 2018/12/19.
//  Copyright © 2018 jianghongbing. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController {
    lazy var webView: WKWebView = {
        let configuration = WKWebViewConfiguration()
        //1.设置网页的用户代理的程序名,会将该字符串拼接在用户代理字符串的后面
        configuration.applicationNameForUserAgent = "my iPhone"
        //2.设置webView的偏好设置
        let preferences = WKPreferences()
        //最小字体
        preferences.minimumFontSize = 20
        //是否可以通过js来打开一个窗口
        preferences.javaScriptCanOpenWindowsAutomatically = true
        //设置webView中的javascript是否可用,默认为true
        preferences.javaScriptEnabled = true
        configuration.preferences = preferences
        //3.设置进程池,WKProcessPool一个不透明的类
        let pool = WKProcessPool()
        configuration.processPool = pool
        //4.设置userContentController,主要用于webView和js之间的交互
        let userContentController = WKUserContentController()
        configuration.userContentController = userContentController
        //5.设置webView的数据存储,用于设置和获取cooike,indexDB其中的数据
        let dataStore = WKWebsiteDataStore.default()
        configuration.websiteDataStore = dataStore
        //6.是否忽略viewport的缩放限制,允许缩放webView,如果设置该值,会覆盖viewport的user-scale的值
        configuration.ignoresViewportScaleLimits = true
        //7.设置web中video是否直接在网页中播放,true则可以在网页中播放,false只能用iOS原生全屏播放器来播放,在iPhone中默认为false,在iPad上为true,在iOS10之前需要在video标签上加上webkit-playsinline属性
        configuration.allowsInlineMediaPlayback = true
        //8.是否允许隔空播放,默认为true
        configuration.allowsAirPlayForMediaPlayback = true
        //9.是否允许画中画播放
        configuration.allowsPictureInPictureMediaPlayback = true
        //10.通过用户的动作来播放媒体
        configuration.mediaTypesRequiringUserActionForPlayback = .all
        //11.网页中的文字选择范围
        configuration.selectionGranularity = .dynamic
        //12.网页中数据识别类型,如果识别到文本匹配相关数据,就在文本的下面加上一个超链接的标志
        configuration.dataDetectorTypes = .all
        
        //13.设置特殊的Scheme的URL的回调,必须添加WKWebView不能处理的Scheme的URL,对之定义的scheme的url进行拦截
        if !WKWebView.handlesURLScheme("JHB") {
            configuration.setURLSchemeHandler(self.schemeHandler, forURLScheme: "JHB")
        }
        
//        configuration.setURLSchemeHandler(self.httpsSchemeHandler, forURLScheme: "https")
        
        
        let webView = WKWebView(frame: self.view.bounds, configuration: configuration)
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        let filePath = Bundle.main.path(forResource: "index", ofType: "html")
        let url = URL(fileURLWithPath: filePath!)
        webView.loadFileURL(url, allowingReadAccessTo: url)
//        webView.uiDelegate = self
//        webView.navigationDelegate = self
        return webView
    }()
    
    let schemeHandler = JHBSchemeHandler()
//    let httpsSchemeHandler = HTTPSSchemeHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
    }
    @IBAction func goback(_ sender: Any) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    @IBAction func gotoBaidu(_ sender: Any) {
        let url = URL(string: "https://www.baidu.com")
        let request = URLRequest(url: url!)
        webView.load(request)
    }
    
    deinit {
        webView.configuration.setURLSchemeHandler(nil, forURLScheme: "JHB")
    }
}

//extension ViewController: WKUIDelegate {
////    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
////        if navigationAction.targetFrame == nil {
////            webView.load(navigationAction.request)
////        }
////        return nil
////    }
//}

//extension ViewController: WKNavigationDelegate {
//    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
//        print(navigationAction)
//        decisionHandler(.allow)
//    }
//}
