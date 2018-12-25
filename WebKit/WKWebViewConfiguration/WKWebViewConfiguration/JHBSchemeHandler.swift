//
//  JHBSchemeHandler.swift
//  WKWebViewConfiguration
//
//  Created by pantosoft on 2018/12/25.
//  Copyright © 2018 jianghongbing. All rights reserved.
//

import Foundation
import WebKit
class JHBSchemeHandler: NSObject {
    
}

extension JHBSchemeHandler: WKURLSchemeHandler {
    func webView(_ webView: WKWebView, start urlSchemeTask: WKURLSchemeTask) {
        print(#function, #line, urlSchemeTask)
        if let path = Bundle.main.path(forResource: "dog1", ofType: "png"), let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            let response = URLResponse(url: URL(fileURLWithPath: path), mimeType: "image/*", expectedContentLength: data.count, textEncodingName: nil)
            urlSchemeTask.didReceive(response)
            urlSchemeTask.didReceive(data)
            urlSchemeTask.didFinish()
        }
    }
    
    func webView(_ webView: WKWebView, stop urlSchemeTask: WKURLSchemeTask) {
        print(#function, #line, urlSchemeTask)
    }
}
