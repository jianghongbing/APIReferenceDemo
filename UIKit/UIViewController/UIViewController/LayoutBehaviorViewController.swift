//
//  LayoutBehaviorViewController.swift
//  UIViewController
//
//  Created by pantosoft on 2017/6/26.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class LayoutBehaviorViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        navigationController?.navigationBar.isTranslucent = false
        navigationController?.setToolbarHidden(false, animated: animated)
//        navigationController?.toolbar.isTranslucent = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        navigationController?.navigationBar.isTranslucent = true
        navigationController?.setToolbarHidden(true, animated: animated)
//        navigationController?.toolbar.isTranslucent = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        extendedLayoutTest()
//        automaticallyAdjustsScrollViewInsetsTest()
        layoutGuideTest()

    }
    
    //4.当controller的View updateViewConstraints会收到该消息,一般不直接调用该方法,一般通过view的setNeedsUpdateConstraints来更新constraints
    override func updateViewConstraints() {
        super.updateViewConstraints()
        print(#function)
    }
    
    private func extendedLayoutTest() {
        //1.扩展布局:默认值为all也就是说,从屏幕的边缘开始布局,如果当前控制器在navigation controller或者tabbar controller中时,并且navigationBar或者tabbar是透明的,布局会从屏幕的顶部开始布局到屏幕的底部结束.如果不为all,缺少那一项,布局将会从指定位置开始布局,而不是从屏幕的边缘开始布局,如果navigationBar和tabbar不会透明,布局默认会从navigationBar的底部开始布局到toolbar或tabbar的顶部结束,而不是从屏幕的顶部开始布局到toolbar或者tabbar的底部结束
        edgesForExtendedLayout = .all
        
        //2.是否扩展layout到不透明的bar(如navigationBar,tabbar,toolbar),默认为false,也就是说当controller在navgation controller或者在tabbar controller,布局会以navigationbar的下面为起点,toolbar或者tabbar的上面为重点,而不是以屏幕的顶点或者底部为起点和终点,如果为true,布局会从屏幕的顶部和底部为起点和终点
        extendedLayoutIncludesOpaqueBars = true
        
        let testView = UIView()
        testView.backgroundColor = .red
        testView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(testView)
        
        let views = ["testView": testView]
        let horizonalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "|[testView]|", options: .init(rawValue: 0), metrics: nil, views: views)
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[testView]|", options: .init(rawValue: 0), metrics: nil, views: views)
        NSLayoutConstraint.activate(horizonalConstraints + verticalConstraints)
    }
    
    private func automaticallyAdjustsScrollViewInsetsTest() {
        //3.automaticallyAdjustsScrollViewInsets:是否允许系统根据当前控制器中是否有navigation bar, status bar, tool bar, tabbar,来自动给scrollView设置合适的insets,默认为true,会适当的给scrollView设置contentInset.如果为false,系统不会自动为scrollView设置contentInsets
        automaticallyAdjustsScrollViewInsets = false
        let tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "tableViewCell")
        view.addSubview(tableView)
        
    }
    
    private func layoutGuideTest() {
        
        // layoutGuide:系统会依据当前控制器是否在navigation controller或者tabbar controller来给controller设置适当的layout guide,如果使用了auto layout来布局,可以使用topLayoutGuide和bottomLayoutGuide来辅助我们布局
        let top = topLayoutGuide
        let bottom = bottomLayoutGuide
        
        
        let redView = UIView()
        redView.backgroundColor = .red
        redView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(redView)
        
        let blueView = UIView()
        blueView.backgroundColor = .blue
        blueView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(blueView)
        
        
        let views:[String : Any] = ["redView": redView, "blueView": blueView, "top": top, "bottom": bottom]
        var horizonalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-(50)-[redView]-(50)-|", options: .init(rawValue: 0), metrics: nil, views: views)
        var verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[top]-(20)-[redView(100)]", options: .init(rawValue: 0), metrics: nil, views: views)
        NSLayoutConstraint.activate(horizonalConstraints + verticalConstraints)
        
        horizonalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-(50)-[blueView]-(50)-|", options: .init(rawValue: 0), metrics: nil, views: views)
        verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[blueView(100)]-(20)-[bottom]", options: .init(rawValue: 0), metrics: nil, views: views)
        NSLayoutConstraint.activate(horizonalConstraints + verticalConstraints)
    }
}


extension LayoutBehaviorViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)
        cell.textLabel?.text = "row:\(indexPath.row)"
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print(scrollView.contentInset, scrollView.contentOffset)
    }
}
