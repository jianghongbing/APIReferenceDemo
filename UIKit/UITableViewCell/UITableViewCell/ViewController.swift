//
//  ViewController.swift
//  UITableViewCell
//
//  Created by pantosoft on 2017/8/30.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class ViewController: UITableViewController{
    enum CellIdentifier: String {
        case `default` = "default"
        case value1 = "valueOne"
        case value2 = "valueTwo"
        case subTitle = "subTitle"
        case custom1 = "customOne"
        case custom2 = "customTwo"
        init?(rawValue: String) {
            switch rawValue {
            case "default":
                self = .default
            case "valueOne":
                self = .value1
            case "valueTwo":
                self = .value2
            case "subTitle":
                self = .subTitle
            case "custom1":
                self = .custom1
            case "custom2":
                self = .custom2
            default:
                return nil
            }
        }
        static let enumItemCount = 6
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        tableView.allowsMultipleSelectionDuringEditing = true
        tableView.register(CustomOneTableVewCell.classForCoder(), forCellReuseIdentifier: CellIdentifier.custom1.rawValue)
        //UITableViewCell作为UITableView的最小单元,用来呈现其中内容
        //1.系统提供的cell样式有4种
        //case `default` // Simple cell with text label and optional image view (behavior of UITableViewCell in iPhoneOS 2.x)
        //case value1 // Left aligned label on left and right aligned label on right with blue text (Used in Settings)
        //case value2 // Right aligned label on left with blue text and left aligned label on right (Used in Phone/Contacts)
        //case subtitle // Left aligned label on top and left aligned label on bottom with gray text (Used in iPod).
        
        
    }
    
    //#MARK: editing TableView
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.tableView.setEditing(editing, animated: true)
    }
    
    
    //#MARK: UITableViewDataSource && UITableViewDelegate
    override func numberOfSections(in tableView: UITableView) -> Int {
        return CellIdentifier.enumItemCount
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell?
        let image = UIImage.image(fromColor: .red, imageSize: CGSize(width: 40.0, height: 40.0))
        switch indexPath.section {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.default.rawValue)
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: CellIdentifier.default.rawValue)
            }
            //设置系统cell的textlabel的text
            cell?.textLabel?.text = "section:\(indexPath.section) row:\(indexPath.row)"
            //设置detailText
            cell?.detailTextLabel?.text = "detailText"
            //设置图片
//            cell?.imageView?.image = image
            //设置accessoryView,当设置accessoryType和accessoryView时,accessoryView会覆盖accessoryType
            cell?.accessoryView = UISwitch()
            //设置accessoryType
            cell?.accessoryType = .disclosureIndicator
            //设置编辑状态下的accessoryView
            cell?.editingAccessoryView = UIButton(type: .contactAdd)
            //设置编辑状态下的accessoryType
            cell?.editingAccessoryType = .checkmark
            //设置cell的selectionStyle
            cell?.selectionStyle = .default
            
            //选中的背景视图
            let selectedBackgroundView = UIView()
            selectedBackgroundView.backgroundColor = .red
            cell?.selectedBackgroundView = selectedBackgroundView
            
            //多选情况下的背景视图
            let multipleSelectedBackgroundView = UIView()
            multipleSelectedBackgroundView.backgroundColor = .orange
            cell?.multipleSelectionBackgroundView = multipleSelectedBackgroundView
            
            cell?.separatorInset = .zero
            //设置缩进级别
            cell?.indentationLevel = 10
            //设置缩进的宽度,最后内容的缩进等于缩进级别乘以缩进的宽度
            cell?.indentationWidth = 1
            //编辑状态下是否缩进,通过属性来设置貌似无效,通过代理方法来设置可以生效
            cell?.shouldIndentWhileEditing = false
            //设置分割器的inset
//            cell?.separatorInset = UIEdgeInsets(top: 30, left: 10, bottom: 30, right: 10)
            //是否显示记录器
            cell?.showsReorderControl = true
            //设置3DTouch
            cell?.focusStyle = .default
        

        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.value1.rawValue)
            if cell == nil {
                cell = UITableViewCell(style: .value1, reuseIdentifier: CellIdentifier.value1.rawValue)
            }
            cell?.textLabel?.text = "section:\(indexPath.section) row:\(indexPath.row)"
            cell?.detailTextLabel?.text = "detailText"
            cell?.imageView?.image = image
            cell?.accessoryType = .detailDisclosureButton
            cell?.selectionStyle = .blue
            cell?.focusStyle = .custom
//            cell?.shouldIndentWhileEditing = false

        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.value2.rawValue)
            if(cell == nil) {
                cell = UITableViewCell(style: .value2, reuseIdentifier: CellIdentifier.value2.rawValue)
            }
            cell?.contentView.backgroundColor = .orange
            cell?.textLabel?.text = "section:\(indexPath.section) row:\(indexPath.row)"
            cell?.detailTextLabel?.text = "detailText"
//            cell?.imageView?.image = image
            cell?.accessoryType = .checkmark
            cell?.editingAccessoryType = .checkmark
            cell?.selectionStyle = .gray
            cell?.focusStyle = .default
//            cell?.indentationLevel = -1;
//            cell?.indentationWidth = 10
            cell?.separatorInset = .zero
            cell?.shouldIndentWhileEditing = true
        case 3:
            cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.subTitle.rawValue)
            if cell == nil {
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: CellIdentifier.subTitle.rawValue)
            }
            cell?.textLabel?.text = "section:\(indexPath.section) row:\(indexPath.row)"
            cell?.detailTextLabel?.text = "detailText"
            cell?.imageView?.image = image
            cell?.accessoryType = .detailButton
            cell?.editingAccessoryType = .checkmark
            cell?.selectionStyle = .default
        case 4:
            cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.custom1.rawValue, for: indexPath)
            let customOneCell = cell as? CustomOneTableVewCell
            customOneCell?.nameLabel.text = "testtesttest"
            customOneCell?.detailLabel.text = "hehhehehehehhe"
        case 5:
//            cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.custom2.rawValue, for: indexPath)
            cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.subTitle.rawValue)
            if cell == nil {
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: CellIdentifier.subTitle.rawValue)
            }
            cell?.textLabel?.text = "section:\(indexPath.section) row:\(indexPath.row)"
            cell?.detailTextLabel?.text = "detailText"
            cell?.imageView?.image = image
        default:
            break;
        }
        return cell!
    }
    
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            //判断cell是否被选中
            let isSelected = cell.isSelected
            print("cell is selected:\(isSelected)")
            //单独设置cell的编辑状态,该方法在table设置编辑状态后调用,不需要直接用cell来调用
//            cell.setEditing(!cell.isEditing, animated: true)
            if let cellIdentifier = cell.reuseIdentifier {
                print("cell identifier:\(cellIdentifier)")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete 
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
//    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
//        return false
//    }
    
}


extension UIImage  {
    class func image(fromColor color: UIColor, imageSize: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(imageSize, true, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
//        context?.fillEllipse(in: CGRect(origin: .zero, size: imageSize))
        context?.fill(CGRect(origin: .zero, size: imageSize))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}





