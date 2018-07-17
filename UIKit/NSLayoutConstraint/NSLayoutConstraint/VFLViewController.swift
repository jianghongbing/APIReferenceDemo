//
//  VFLViewController.swift
//  NSLayoutConstraint
//
//  Created by pantosoft on 2018/7/16.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit

class VFLViewController: UIViewController, CreateView{
    private var myLayoutConstraints: [NSLayoutConstraint] = []
    private var redView: UIView!
    private var greenView: UIView!
    private var blueView: UIView!
    private var orangeView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        redView = createView(with: .red, superView: view)
        greenView = createView(with: .green, superView: view)
        blueView = createView(with: .blue, superView: view)
        orangeView = createView(with: .orange, superView: view)
    }
    
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        if myLayoutConstraints.count > 0 {
            NSLayoutConstraint.deactivate(myLayoutConstraints)
        }
        let views = ["redView": redView!, "greenView": greenView!, "blueView": blueView!, "orangeView": orangeView!]
        let topMargin = self.view.layoutMargins.top + 20
        let bottomMargin = self.view.layoutMargins.bottom + 20
        let leftMargin = self.view.layoutMargins.left
        let rightMargin = self.view.layoutMargins.right
        let metrics = ["horizonalMargin": 10, "verticalMargin": 20, "topMargin": topMargin, "bottomMargin": bottomMargin, "leftMargin": leftMargin, "rightMargin": rightMargin]
        
        var horizonalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-(leftMargin)-[redView(==greenView)]-(horizonalMargin)-[greenView]-(rightMargin)-|", options: [.alignAllTop, .alignAllBottom, .directionLeadingToTrailing], metrics: metrics, views: views)
        
        horizonalConstraints += NSLayoutConstraint.constraints(withVisualFormat: "|-(leftMargin)-[blueView(==orangeView)]-(horizonalMargin)-[orangeView]-(rightMargin)-|", options: [.alignAllTop, .alignAllBottom, .directionLeadingToTrailing], metrics: metrics, views: views)
        
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-(topMargin)-[redView(==blueView)]-(verticalMargin)-[blueView]-(bottomMargin)-|", options: [.alignAllLeading, .alignAllCenterX], metrics: metrics, views: views)
        myLayoutConstraints = horizonalConstraints + verticalConstraints
        NSLayoutConstraint.activate(myLayoutConstraints)
    }
    
    override func viewLayoutMarginsDidChange() {
        super.viewLayoutMarginsDidChange()
        view.setNeedsUpdateConstraints()
    }
}
