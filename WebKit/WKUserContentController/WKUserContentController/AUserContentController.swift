//
//  AUserContentController.swift
//  WKUserContentController
//
//  Created by pantosoft on 2018/12/25.
//  Copyright © 2018 jianghongbing. All rights reserved.
//

import UIKit
import WebKit
class AUserContentController: NSObject {
    fileprivate var delegate: WKScriptMessageHandler?
    init(with delegate: WKScriptMessageHandler?) {
        self.delegate = delegate
    }
}

extension AUserContentController: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        delegate?.userContentController(userContentController, didReceive: message)
    }
}
