//
//  ViewController.swift
//  WKUserContentController
//
//  Created by pantosoft on 2018/12/25.
//  Copyright © 2018 jianghongbing. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController {
    lazy var webView: WKWebView = {
        let configuration = WKWebViewConfiguration()
        //WKUseContentController:主要用于添加脚本给webView和在js中发送消息给webView,实现webView和js之间的交互
        let userContentController = WKUserContentController()
        configuration.userContentController = userContentController
        let webView = WKWebView(frame: self.view.bounds.insetBy(dx: 0, dy: 100), configuration: configuration)
        webView.autoresizingMask = .flexibleWidth
        self.view.addSubview(webView)
        return webView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        addMessageHandlers()
        addUserScripts()
        loadLocalHTML()
    }
    
    private func loadLocalHTML() {
        let path = Bundle.main.path(forResource: "index", ofType: "html")
        let url = URL(fileURLWithPath: path!)
        webView.loadFileURL(url, allowingReadAccessTo: url)
    }

    //
    private func addMessageHandlers() {
        let aUserContentController = AUserContentController(with: self)
        //添加messageHandler,可以在js中window.webKit.name.postmessage的方式发送消息给webView
        //没有参数,js发送不带参数的消息给webView
        webView.configuration.userContentController.add(aUserContentController, name: "funcA")
        //带有参数,js发送带有参数的消息给webView
        webView.configuration.userContentController.add(aUserContentController, name: "funcB")
        
    }
    
    private func removeMessageHandlers() {
        webView.configuration.userContentController.removeScriptMessageHandler(forName: "funcA")
        webView.configuration.userContentController.removeScriptMessageHandler(forName: "funcB")
    }
    
    //添加脚本到网页中
    private func addUserScripts() {
        //创建用户脚本,source:js脚本; injecttionTiem:脚本注入时间,atDocumentStart:在document创建之后,所有资源加载完成之前注入,atDocumentEnd,在document创建之后,其他子资源加载完成之前注入; forMainFrameOnly:是否只注入到主frame,如果为false,脚本会注入到网页中的所有frame中
        let scriptOne = WKUserScript(source: "function scriptOne() {let p = document.createElement(\"p\");p.textContent = \"script add by native\";document.body.appendChild(p);}", injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        //注入脚本
        webView.configuration.userContentController.addUserScript(scriptOne)
    }
    
    //移除网页到脚本中
    private func removeUserScripts() {
        webView.configuration.userContentController.removeAllUserScripts()
    }
    
    deinit {
        removeMessageHandlers()
        removeUserScripts()
    }
    
    private func funcA() {
        alert(with: "执行了funcA", message: nil)
    }
    
    private func funcB(a:Int, b:Int) {
        alert(with: "执行了funcB", message: "参数: a=\(a),b=\(b)")
    }
    
    
    @IBAction func excuteJSFunction1(_ sender: Any) {
        //执行js脚本,闭包回调的参数,result:是执行js函数后返回的结构,error是执行函数过程发生的错误
        webView.evaluateJavaScript("funcOne()") { (result, error) in
            if let error = error {
                print("error:\(error)")
            }else if let result = result {
                print("result:\(result)")
            }
        }
    }
    
    @IBAction func excuteJSFunction2(_ sender: Any) {
        webView.evaluateJavaScript("funcTwo(5, 6)") { (result, error) in
            if let error = error {
                print("error:\(error)")
            }else if let result = result {
                print("result:\(result)")
            }
        }
    }
    
    @IBAction func excuteJSFunction3(_ sender: Any) {
        webView.evaluateJavaScript("funcThree(5, 6)") { (result, error) in
            if let error = error {
                print("error:\(error)")
            }else if let result = result {
                print("result:\(result)")
            }
        }
    }
    
    
    @IBAction func checkAllRuleList(_ sender: Any) {
        let ruleListStore = WKContentRuleListStore(url: webView.url!)
        ruleListStore?.getAvailableContentRuleListIdentifiers{
            if let identifiers = $0 {
                identifiers.forEach{
                    print("identifier:\($0)")
                }
            }
        }
    }
    @IBAction func addRuleList(_ sender: Any) {
    }
}

extension ViewController: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        //发送消息的名称,也就是在添加messageHandler时的名称
        let title = message.name
        //发送消息的数据,相当于函数的参数
        let body = message.body
        //添加messageHandler的所在的webView
//        let webView = message.webView
        //发送消息给messageHanadler的网页的相关信息
//        let frameInfo = message.frameInfo
        if title == "funcA" {
            funcA()
        }else if (title == "funcB") {
            if let parameters = body as? Dictionary<String, Int>, let a = parameters["A"], let b = parameters["B"] {
                funcB(a: a, b: b)
            }
        }
    }
}

extension ViewController {
    private func alert(with title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}
