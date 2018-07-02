//
//  UIApplicationShortcutItem+Identifier.swift
//  UIApplicationShortcutItem
//
//  Created by pantosoft on 2018/6/29.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import Foundation
import UIKit
extension UIApplicationShortcutItem {
    enum Identifier: String, CustomStringConvertible {
        case search, addFriend, location, mail
        init?(type: String) {
            guard let last = type.components(separatedBy: ".").last else {return nil}
            self.init(rawValue: last)
        }
        var type: String {
            return Bundle.main.bundleIdentifier! + "." + self.rawValue
        }
        var isDynamicItem: Bool {
            switch self {
            case .location, .mail:
                return true
            default:
                return false
            }
        }
        var description: String {
            if isDynamicItem {
                return "this is a dynamic shortcut item, you can change info of the item"
            }else {
                return "this is a static shortcut item, you can't change info of the item"
            }
        }
    }
    
    
    
    
    private var identifier: Identifier? {
        return Identifier(type: self.type)
    }
    var isDynamicItem: Bool {
        guard identifier != nil else {
            return false
        }
        return identifier!.isDynamicItem
    }
    
    var itemDescription:String {
        guard identifier != nil else {
            return ""
        }
        return identifier!.description
    }
}
