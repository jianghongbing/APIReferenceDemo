//
//  LifeCircleViewController.swift
//  UIView
//
//  Created by pantosoft on 2017/7/31.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class LifeCircleViewController: UIViewController {

    var redView: UIView?
    @IBOutlet weak var yellowView: LifeCircleView!
    @IBOutlet weak var yellowViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var yellowViewWidthConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setToolbarHidden(false, animated: true)
        //1.创建view的三种方式

        //1.1.使用initWithFrame的方式来创建View:会调用initWithFrame方法,不会调用awakeFromNib和initWithCoder的方法
        self.initViewByFrame()
        //1.2.使用nib的形式创建view,会调用awakeFromNib方法,不会调用initWithFrame和initWithCoder方法
        self.initViewByNib()
        //1.3.直接在storyboard的controller中添加View,会调用initWithCoder和awakeNib方法,不会调用initWithFrame的方法
        //2.通过任何一种方式创建view后并且将其添加到superView中,会调用updateConstraints,layoutSubiviews和drawInRect方法
        //2.1 updateConstraints:用于更新自己和subviews的layoutConstraints
        //2.2 layoutSubviews:用户更精确的布局subview
        //2.3 drawInRect:绘制view里面的内容
        //3.当将一个视图添加到superView中去,也调用,willMoveToSuperView,didMoveToSuperView方法
        //4.view从superView中移除时,会调用willRemoveSuperView,
        //5.
    }

    private func initViewByFrame() {
        let redView = LifeCircleView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        redView.backgroundColor = .red
        self.redView = redView
        view.addSubview(redView)
    }

    private func initViewByNib() {
        let blueView = Bundle.main.loadNibNamed("TestView", owner: nil, options: nil)?.last as? UIView
        blueView?.frame = CGRect(x: 100, y: 250, width: 100, height: 100)
        if let blueView = blueView {
            view.addSubview(blueView)
        }
    }
    @IBAction func reUpdateConstraints(_ sender: Any) {

    }
    @IBAction func reUpdateConstraintsIfNeed(_ sender: Any) {

    }
    @IBAction func reLayoutSubviews(_ sender: Any) {
        if let redView = self.redView {
            redView.setNeedsLayout() //强制重新布局,会调用layoutSubview方法
        }
    }
    @IBAction func reLayoutSubviewsIfNeed(_ sender: Any) {
        if let redView = self.redView {
            var frame = redView.frame
            frame.size = CGSize(width: 200, height: 200)
            redView.frame = frame
            redView.layoutIfNeeded() //
        }
    }
    @IBAction func reDraw(_ sender: Any) {
    }
}
