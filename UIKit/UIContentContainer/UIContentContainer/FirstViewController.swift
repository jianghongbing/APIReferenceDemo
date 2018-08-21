//
//  FirstViewController.swift
//  UIContentContainer
//
//  Created by pantosoft on 2018/8/21.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var slider: UISlider!
    static public let MaxHeight: CGFloat = 400
    let minHeightInRegurlar: CGFloat = 200
    let minHeightInCompact: CGFloat = 100
    override func viewDidLoad() {
        super.viewDidLoad()
        updatePreferredContentSize(with: traitCollection)
    }
    
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
        updatePreferredContentSize(with: newCollection)
    }
    
    private func updatePreferredContentSize(with traitCollection : UITraitCollection) {
        let view = parent != nil ? parent!.view : self.view
        var width: CGFloat = 0
        var height: CGFloat = 0
        if traitCollection.verticalSizeClass == .compact {
            width = max(view!.bounds.width, view!.bounds.height)
            height = minHeightInCompact + minHeightInCompact * CGFloat(slider.value)
        }else {
            width = min(view!.bounds.width, view!.bounds.height)
            height = minHeightInRegurlar + minHeightInRegurlar * CGFloat(slider.value)
        }
        preferredContentSize = CGSize(width: width, height: height)
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        updatePreferredContentSize(with: traitCollection)
    }
}
