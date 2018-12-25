//
//  HTTPSchemeHandler.swift
//  WKWebViewConfiguration
//
//  Created by pantosoft on 2018/12/25.
//  Copyright © 2018 jianghongbing. All rights reserved.
//

import UIKit
import WebKit
class HTTPSSchemeHandler: NSObject {

}

extension HTTPSSchemeHandler: WKURLSchemeHandler {
    func webView(_ webView: WKWebView, start urlSchemeTask: WKURLSchemeTask) {
        print(#function, #line, urlSchemeTask)
    }
    
    func webView(_ webView: WKWebView, stop urlSchemeTask: WKURLSchemeTask) {
        print(#function, #line, urlSchemeTask)
    }
}
