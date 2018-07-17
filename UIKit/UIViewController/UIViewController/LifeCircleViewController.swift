//
//  LifeCircleViewController.swift
//  UIViewController
//
//  Created by pantosoft on 2017/6/26.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class LifeCircleViewController: UIViewController {
    
//    @IBOutlet weak var redView: UIView!
//    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
//    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        debugPrint(#function)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        debugPrint(#function)
    }
    
//    @objc private func test(_ sender: Any) {
//        
//        view.layoutIfNeeded()
//    }
//    convenience init() {
//        self.init(nibName: nil, bundle: nil)
//        debugPrint(#function)
//    }
    
    //1.在load view中可以将view controller中默认的View替换成自定义的view
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.orange
        debugPrint(#function)
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "test", style: .plain, target: self, action: #selector(test(_:)))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint(#function)
        title = "Life Circle"
        
        let redView = UIView()
        redView.backgroundColor = .red
        redView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(redView)
        
        redView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        redView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        redView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        redView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        //view controller的生命周期,下面是各个方法调用的顺序
        //1.初始化.如果通过storyboard获取的viewController,那么会调用initWithCoder方法,如果是通过xib方式,会调用initWihtNibName:bundle的方法,如果是通过纯代码的方式,那么会调用init
        //2.awakeFromNib: 通过storyboard或者xib的方式,会走awakeFromNib的方法,纯代码方式不会走该方法
        //3.loadView: 可以在这个方法中将view controller中的view换成自己定义的view
        //4.viewDidLoad:视图已经加载完成的时候调用,该方法只会调用一次
        //5.viewWillAppear:view将要出现的时候会调用该方法,每一次view 将要出现的时候都会调用,可能会调用多次
        //6.viewWillLayoutSubViews:view中的subView将要布局的时候,会收到该消息,可能会调用多次
        //7.viewDidLayoutSubViews:view中的subView都布局完成的时候,会收到该消息,可能会调用多次
        //8.viewDidAppear:view以及view的subView显示完成的时候调用,可能会调用多次
        //7.viewWillDisappear:在view将要消息的时候会收到该消息,可能会调用多次
        //8.viewDidDisappear: 在view已经消息的时候会收到该消息,可能会调用多次
        //9.didReceiveMemoryWarning:在收到内存警告的时候,会收到该消息
        //10.dealloc当控制器对象被回收的时候,会收到该消息
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        debugPrint(#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        debugPrint(#function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        debugPrint(#function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        debugPrint(#function)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        debugPrint(#function)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        debugPrint(#function)
    }
    
    
    override func didReceiveMemoryWarning() {
        debugPrint(#function)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        debugPrint(#function)
    }
    
    deinit {
        debugPrint(#function)
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        print(#function)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.setNeedsUpdateConstraints()
    }
    
}
