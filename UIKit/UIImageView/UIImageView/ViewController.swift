//
//  ViewController.swift
//  UIImageView
//
//  Created by jianghongbing on 2017/5/17.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    fileprivate var imageViewOne: UIImageView?
    fileprivate var imageViewTwo: UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        singleImageInImageView()
        animatedImageView()

    }
    func singleImageInImageView() {
        let normalImagePath = Bundle.main.path(forResource: "1.jpg", ofType: nil)
        let normalImage = UIImage(contentsOfFile: normalImagePath!)

        let highlightedImagePath = Bundle.main.path(forResource: "2.jpg", ofType: nil)
        let highlightedImage = UIImage(contentsOfFile: highlightedImagePath!)

        let imageView = UIImageView(image: normalImage, highlightedImage: highlightedImage)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)

        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true

        addTapGestureRecognizerForView(view: imageView)
        imageViewOne = imageView


    }

    func animatedImageView() {
        var normalImages:[UIImage] = []
        for i in 1 ... 6 {
            let imagePath = Bundle.main.path(forResource: "\(i)", ofType:"jpg" )
            let image = UIImage(contentsOfFile: imagePath!)
            normalImages.append(image!)
        }
        
        let imageView = UIImageView(image: normalImages.first, highlightedImage: normalImages.last)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        //设置动画的图片和时间以及重复动画的次数
        imageView.animationImages = normalImages
//        imageView.highlightedAnimationImages = normalImages.reversed()
        imageView.animationDuration = 2.0
        imageView.animationRepeatCount = 2

        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 300).isActive = true

        imageViewTwo = imageView

        //image view默认的处理touch事件的交互性是关闭,即不能处理touch事件,需要将isUserInteractionEnabled设置为true
        imageView.isUserInteractionEnabled = true
        addTapGestureRecognizerForView(view: imageView)

    }

    
    @IBAction func startAnimation(_ sender: Any) {
        if let imageView = imageViewTwo {
            imageView.isHighlighted = !imageView.isHighlighted;
            imageView.isAnimating ? imageView.stopAnimating() : imageView.startAnimating()
        }

    }
    @IBAction func highlightedImageView(_ sender: Any) {
        if let imageView = imageViewOne {
            //设置和获取imageView的isHighlighted状态
            imageView.isHighlighted = !imageView.isHighlighted
        }
    }

    func addTapGestureRecognizerForView(view: UIView) {
        let tapGestrueRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedView(_:)))
        view.addGestureRecognizer(tapGestrueRecognizer)
    }

    func tappedView(_ gestureRecognizer: UITapGestureRecognizer)  {
        if let view = gestureRecognizer.view {
            print("tap view:\(view)")
        }
    }
}

