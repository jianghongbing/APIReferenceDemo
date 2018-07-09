//
//  ViewController.swift
//  UIPreviewInteraction
//
//  Created by pantosoft on 2018/7/5.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var previewProgressView: UIProgressView!
    @IBOutlet weak var commitProgressView: UIProgressView!
    @IBOutlet weak var previewStateLabel: UILabel!
    @IBOutlet weak var commitStateLabel: UILabel!
    private var previewInteraction: UIPreviewInteraction!
    override func viewDidLoad() {
        super.viewDidLoad()
        //UIPreviewInteraction:交互预览,通过3d感应,来预览某个界面
        //交互的两个阶段
        //1.preview:预览阶段,当施加一定的压力在view上,设置会检测到,进入preview阶段,一般可以此阶段push或则modal目标控制器,预览该控制器的界面
        //2.在preview阶段继续施加压力,会进入commit阶段,可以更新交互动画的进度
        if traitCollection.forceTouchCapability == .available {
            previewInteraction = UIPreviewInteraction(view: view)
            previewInteraction.delegate = self
        }

    }
}


extension ViewController: UIPreviewInteractionDelegate {
    func previewInteractionShouldBegin(_ previewInteraction: UIPreviewInteraction) -> Bool {
        self.previewProgressView.setProgress(0, animated: false)
        self.commitProgressView.setProgress(0, animated: false)
        self.previewStateLabel.text = "Begin"
        self.commitStateLabel.text = "Unrecognized"
        return true
    }
    
    func previewInteractionDidCancel(_ previewInteraction: UIPreviewInteraction) {
        self.previewProgressView.setProgress(0, animated: true)
        self.commitProgressView.setProgress(0, animated: true)
        self.previewStateLabel.text = "Canceled"
        self.commitStateLabel.text = "Canceled"
    }
    
    func previewInteraction(_ previewInteraction: UIPreviewInteraction, didUpdatePreviewTransition transitionProgress: CGFloat, ended: Bool) {
        //获取按压的位置
        let location = previewInteraction.location(in: view)
        print("location:\(location)")
        self.previewProgressView.setProgress(Float(transitionProgress), animated: true)
        if(ended) {
            self.previewStateLabel.text = "Completed"
            self.commitStateLabel.text = "Begin"
        }else {
            self.previewStateLabel.text = "Progress"
        }
    }
    
    func previewInteraction(_ previewInteraction: UIPreviewInteraction, didUpdateCommitTransition transitionProgress: CGFloat, ended: Bool) {
        self.commitProgressView.setProgress(Float(transitionProgress), animated: true)
        if ended {
            self.commitStateLabel.text = "Completed"
        }else {
            self.commitStateLabel.text = "Progress"
        }
    }
    
    
}

