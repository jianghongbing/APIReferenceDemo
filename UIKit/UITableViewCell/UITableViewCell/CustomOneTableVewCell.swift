//
//  CustomOneTableVewCell.swift
//  UITableViewCell
//
//  Created by pantosoft on 2017/9/4.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class CustomOneTableVewCell: UITableViewCell {
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    fileprivate func commonInit() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(detailLabel)
        
        nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        nameLabel.leftAnchor.constraint(greaterThanOrEqualTo: contentView.leftAnchor).isActive = true
        nameLabel.rightAnchor.constraint(lessThanOrEqualTo: contentView.rightAnchor).isActive = true
        
        detailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5.0).isActive = true
        detailLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        detailLabel.centerXAnchor.constraint(equalTo: nameLabel.centerXAnchor).isActive = true
        detailLabel.leftAnchor.constraint(greaterThanOrEqualTo: contentView.leftAnchor).isActive = true
        detailLabel.rightAnchor.constraint(lessThanOrEqualTo: contentView.rightAnchor).isActive = true
    }
    
    
    //当tableView开始编辑或者取消编辑的时候会触发该方法,不要直接用cell调用
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if(editing) {
            print("set editing")
        }else {
            print("cancel editing")
        }
    }
    
    //当选中或者取消选中时,会触发该方法,不要直接通过cell调用
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            print("set selected")
        }else {
            print("cancel selected")
        }
    }
    
    //当触摸cell或者由触摸状态离开会触发该方法,不要直接通过cell调用
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        if highlighted {
            print("set highlighted")
        }else {
            print("cancel highlighted")
        }
    }
    
    //当tableView将要进入编辑状态下的时候,会调用该方法
    override func willTransition(to state: UITableViewCellStateMask) {
        super.willTransition(to: state)
        print("will transition to state:\(state)")
    }
    
    //当tableView已经进入编辑状态下的时候,会调用该方法
    override func didTransition(to state: UITableViewCellStateMask) {
        super.didTransition(to: state)
        print("did transition to state:\(state)")
    }
    
    //每次重复利用cell的时候会触发该方法,不要直接通过cell调用
    override func prepareForReuse() {
        super.prepareForReuse()
        print(#function, #line, #file)
    }
}
