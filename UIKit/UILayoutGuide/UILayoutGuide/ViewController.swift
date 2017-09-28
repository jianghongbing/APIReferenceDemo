//
//  ViewController.swift
//  UILayoutGuide
//
//  Created by pantosoft on 2017/9/26.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //UILayoutGuide: 用于定义一块区域,不需要完整的定义(x,y,width,height),可以只定义某一个方向上的位置,来和autoLayout交互
        //UILayoutGuide的作用
        //1.在LayoutGuide出现之前,autoLayout在某些情况下不能满足某些约束,一般都用额外的view来辅助,用于占位,而现在用layout guide就可以和autolayout交互
        //1.1 UILayoutGuide和傀儡视图的比较
        //1.1.1 UILayoutGuide不会出现在视图层面上,不需要成为某个视图的subview,因此更加高效
        //1.1.2 比view更好的debug
        layoutGuideTest()
        layoutGuideTestTwo()
        
        //1.2 用于black box,作为一个傀儡容器,用来约束里面的视图的constraints,而不用将里面的view放在一个view上面
        layoutGuideTestThree();
        
        //2 viewController的toplayoutGuide和bottomLayoutGuide
        //2.1 status bar,navigation bar 会影响toplayoutGuide的length值,当status bar 和 navigation bar都隐藏,length为0,如果两者都有为status bar 和navigation bar 的高度的和,如果只有一个,就为他的高度
        //2.2 tool bar, tabbar,影响bottom Layout guide,当tabbar存在且没有隐藏,length为tabbar的高度,当toolbar存在且没有被隐藏,length为tabbar的高度,否则为0
        //2.3 在iOS11中,取消了controller的topLayoutGuide和bottomLayoutGuide,取而代之的是view的safeAreaLayoutGuide
        topLayoutGuideAndBottomLayoutGuide()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setToolbarHidden(false, animated: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setToolbarHidden(true, animated: true)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        for (_,layoutGuide) in view.layoutGuides.enumerated() {
            print(layoutGuide.identifier,layoutGuide.layoutFrame)
        }
    }
    
    //让三个view水平方向的间距相等
    private func layoutGuideTest() {
        let redView = createView(UIColor.red)
        let blueView = createView(UIColor.blue)
        let orangeView = createView(UIColor.orange)
        
        let layoutGuideOne = UILayoutGuide()
        layoutGuideOne.identifier = "one"
        view.addLayoutGuide(layoutGuideOne)
        
        let layoutGuideTwo = UILayoutGuide()
        layoutGuideTwo.identifier = "two"
        view.addLayoutGuide(layoutGuideTwo)
        
        let layoutGuideThree = UILayoutGuide()
        layoutGuideThree.identifier = "three"
        view.addLayoutGuide(layoutGuideThree)
        
        let layoutGuideFour = UILayoutGuide()
        layoutGuideFour.identifier = "four"
        view.addLayoutGuide(layoutGuideFour)
        
        layoutGuideTwo.widthAnchor.constraint(equalTo: layoutGuideOne.widthAnchor, multiplier: 1.0).isActive = true
        layoutGuideThree.widthAnchor.constraint(equalTo: layoutGuideOne.widthAnchor, multiplier: 1.0).isActive = true
        layoutGuideFour.widthAnchor.constraint(equalTo: layoutGuideOne.widthAnchor, multiplier: 1.0).isActive = true
        layoutGuideOne.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        layoutGuideFour.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        redView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        redView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        redView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 70).isActive = true
        
        blueView.widthAnchor.constraint(equalTo: redView.widthAnchor, multiplier: 1.0).isActive = true
        blueView.heightAnchor.constraint(equalTo: redView.heightAnchor, multiplier: 1.0).isActive = true
        blueView.topAnchor.constraint(equalTo: redView.topAnchor).isActive = true
        
        orangeView.widthAnchor.constraint(equalTo: redView.widthAnchor, multiplier: 1.0).isActive = true
        orangeView.heightAnchor.constraint(equalTo: redView.heightAnchor, multiplier: 1.0).isActive = true
        orangeView.topAnchor.constraint(equalTo: redView.topAnchor).isActive = true
        
        redView.leftAnchor.constraint(equalTo: layoutGuideOne.rightAnchor).isActive = true
        redView.rightAnchor.constraint(equalTo: layoutGuideTwo.leftAnchor).isActive = true
        blueView.leftAnchor.constraint(equalTo: layoutGuideTwo.rightAnchor).isActive = true
        blueView.rightAnchor.constraint(equalTo: layoutGuideThree.leftAnchor).isActive = true
        orangeView.leftAnchor.constraint(equalTo: layoutGuideThree.rightAnchor).isActive = true
        orangeView.rightAnchor.constraint(equalTo: layoutGuideFour.leftAnchor).isActive = true
    }
    
    private func layoutGuideTestTwo() {
        let layoutGuideFive = UILayoutGuide()
        layoutGuideFive.identifier = "five"
        view.addLayoutGuide(layoutGuideFive)
        
        let layoutGuideSix = UILayoutGuide()
        layoutGuideSix.identifier = "six"
        view.addLayoutGuide(layoutGuideSix)
        
        let purpleView = createView(UIColor.purple)
        let grayView = createView(UIColor.gray)
        let greenView = createView(UIColor.green)
        
        let metrics = ["width": 100.0]
        let views:[String: Any] = ["purpleView": purpleView, "grayView": grayView, "greenView": greenView,"layoutGuideFive": layoutGuideFive, "layoutGuideSix": layoutGuideSix]
        
        
        let horzonalConstriants = NSLayoutConstraint.constraints(withVisualFormat: "H:|-[purpleView(==width)]-[layoutGuideFive]-[grayView(==purpleView)]-[layoutGuideSix(==layoutGuideFive)]-[greenView(==purpleView)]-|", options: [.alignAllTop, .alignAllBottom], metrics: metrics, views: views)
        
        layoutGuideFive.topAnchor.constraint(equalTo: view.topAnchor, constant: 180).isActive = true
        layoutGuideFive.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        NSLayoutConstraint.activate(horzonalConstriants)
        
    }
    
    private func layoutGuideTestThree() {
        let layoutGuide = UILayoutGuide()
        layoutGuide.identifier = "blackBox"
        view.addLayoutGuide(layoutGuide)
        
        layoutGuide.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant:50).isActive = true
        layoutGuide.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        layoutGuide.widthAnchor.constraint(equalToConstant: 200).isActive = true
        layoutGuide.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        let yellowView = createView(UIColor.yellow)
        let cyanView = createView(UIColor.cyan)
        
        
        
        yellowView.topAnchor.constraint(equalTo: layoutGuide.topAnchor).isActive = true
        yellowView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor).isActive = true
        yellowView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor).isActive = true
        yellowView.trailingAnchor.constraint(equalTo: cyanView.leadingAnchor,constant: -20).isActive = true
        
        cyanView.topAnchor.constraint(equalTo: yellowView.topAnchor).isActive = true
        cyanView.bottomAnchor.constraint(equalTo: yellowView.bottomAnchor).isActive = true
        cyanView.widthAnchor.constraint(equalTo: yellowView.widthAnchor).isActive = true
        cyanView.rightAnchor.constraint(equalTo: layoutGuide.rightAnchor).isActive = true
        
    }
    
    private func topLayoutGuideAndBottomLayoutGuide() {
        let blackView = createView(UIColor.black)
//        let brownView = createView(UIColor.brown)
        let topLayoutAnchor: NSLayoutYAxisAnchor
        let bottomLayoutAnchor: NSLayoutYAxisAnchor
        
        if #available(iOS 11.0, *) {
            topLayoutAnchor = view.safeAreaLayoutGuide.topAnchor
            bottomLayoutAnchor = view.safeAreaLayoutGuide.bottomAnchor
        }else {
            topLayoutAnchor = topLayoutGuide.topAnchor
            bottomLayoutAnchor = bottomLayoutGuide.bottomAnchor
        }
        
        blackView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        blackView.topAnchor.constraint(equalTo: topLayoutAnchor, constant: 250).isActive = true
        blackView.bottomAnchor.constraint(equalTo: bottomLayoutAnchor, constant: -30).isActive = true
        blackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true


//        if #available(iOS 11.0, *) {
//            topLayoutAnchor = view.safeAreaLayoutGuide.topAnchor
//            bottomLayoutAnchor = view.safeAreaLayoutGuide.bottomAnchor
//        }else {
//            topLayoutAnchor = self.topLayoutGuide.topAnchor
//            bottomLayoutAnchor = self.bottomLayoutGuide.bottomAnchor
//        }
//
//        let topLayoutGuide = UILayoutGuide()
//        topLayoutGuide.identifier = "topLayoutGuide"
//        view.addLayoutGuide(topLayoutGuide)
//        topLayoutGuide.topAnchor.constraint(equalTo: topLayoutAnchor).isActive = true
//
//        let bottomLayoutGuide = UILayoutGuide()
//        bottomLayoutGuide.identifier = "bottomLayoutGuide"
//        view.addLayoutGuide(bottomLayoutGuide)
//        bottomLayoutGuide.bottomAnchor.constraint(equalTo: bottomLayoutAnchor).isActive = true
//
//        let views:[String : Any] = ["blackView": blackView, "brownView": brownView, "topLayoutGuide": view.safeAreaLayoutGuide, "bottomLayoutGuide": view.safeAreaLayoutGuide]
//
//        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[topLayoutGuide]-20-[blackView(==100)]-(>=0)-[brownView(==blackView)]-20-[bottomLayoutGuide]", options: [.alignAllRight,.alignAllLeft], metrics: nil, views: views)
//
//        let horizonalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "|-50-[blackView(==100)]", options: .init(rawValue: 0), metrics: nil, views: views);
//        brownView.widthAnchor.constraint(equalTo: blackView.widthAnchor, multiplier: 1.0).isActive = true
//        NSLayoutConstraint.activate(horizonalConstraints + verticalConstraints)
    }
    private func createView(_ backgroundColor:UIColor?) -> UIView {
        let _view = UIView()
        _view.backgroundColor = backgroundColor
        _view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(_view)
        return _view
    }
}


