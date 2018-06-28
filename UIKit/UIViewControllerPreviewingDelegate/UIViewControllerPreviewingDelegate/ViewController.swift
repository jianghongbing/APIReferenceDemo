//
//  ViewController.swift
//  UIViewControllerPreviewingDelegate
//
//  Created by pantosoft on 2018/6/27.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet fileprivate weak var button: UIButton!
    fileprivate var context: UIViewControllerPreviewing?
    override func viewDidLoad() {
        super.viewDidLoad()
        if traitCollection.forceTouchCapability == .available { //检查设别是否支持3dTouch
            context = registerForPreviewing(with: self, sourceView: view)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let label = segue.destination.view.viewWithTag(100) as? UILabel {
            label.text = "Push by normal action"
        }
    }
    
    deinit {
        if let context = self.context {
            unregisterForPreviewing(withContext: context)
        }
    }
}

extension ViewController: UIViewControllerPreviewingDelegate {
    //通过3DTouch的location,来设置previewingContext的source Rect
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
        if let label = viewController.view.viewWithTag(100) as? UILabel {
            label.text = "Previewing by 3D Touch"
        }
        
        if let secondViewController = viewController as? SecondViewController {
            secondViewController.previewActionHandler = {
                self.navigationController?.pushViewController($0, animated: true)
            }
        }
        previewingContext.sourceRect = view.convert(button.frame, from: view)
        return viewController
    }
    //3DTouch事件提交,可以在这里push或者modal目标控制器
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        navigationController?.pushViewController(viewControllerToCommit, animated: true)
    }
}

