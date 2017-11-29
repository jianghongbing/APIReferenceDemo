//
//  ViewController.swift
//  UIImage
//
//  Created by pantosoft on 2017/11/3.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageViewOne: UIImageView!
    @IBOutlet weak var imageViewTwo: UIImageView!
    @IBOutlet weak var imageViewThree: UIImageView!
    @IBOutlet weak var imageViewFour: UIImageView!
    @IBOutlet weak var imageViewFive: UIImageView!
    @IBOutlet weak var imageViewSix: UIImageView!
    @IBOutlet weak var imageViewSeven: UIImageView!
    @IBOutlet weak var imageViewEight: UIImageView!
    @IBOutlet weak var imageViewNine: UIImageView!
    @IBOutlet weak var imageViewTen: UIImageView!
    @IBOutlet weak var leftBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var rightBarButtonItem: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UIImage:表示一张图片,一般用户展示在imageView上面
        //1.UIImage的构建
        //1.1 使用imageNamed:和imageNamed: bundle:compatibleWithTraitCollection:创建image的时候,第一次使用该图片的时候,会从硬盘里面加载图片,之后系统会缓存image,频繁通过该方法来创建该image的时候,会直接从内存里面去读取该图片.当图片在内存中,而没有使用的时候,系统会自动清除该图片的缓存.建议频繁图片的时候使用该方法.如果是图片是PNG类型,可以忽略图片的后缀名,如果不是PNG类型,需要带上图片的完整名称
        let imageOne = UIImage(named: "1")
        let imageTwo = UIImage(named: "2", in: nil, compatibleWith: nil)
//        //1.2 使用imageWithContentOfFile:创建image,系统会直接从硬盘中读取图片,系统不会缓存图片,如果该图片只是用一次的时候,apple建议使用该方法,来减小系统的内存压力
//        if let imagePath = Bundle.main.path(forResource: "5", ofType: "png") {
//            let imageThree = UIImage(contentsOfFile: imagePath)
//        }
        //1.3 UIImage的还可以通过其他方式来创建,如图片的数据流形式,CIImage,CGImage等
        //2.创建特殊的image
        //2.1 创建可动画的图片,系统会通过baseName尝试加载baseName1到baseName1024之间的image,所有的image必须具有一样的size和scale,name:baseName,如一些列的图片iamge1,image2,image3等,image baseName是image
        let animateImage = UIImage.animatedImageNamed("image", duration: 1.0)
        imageViewOne.image = animateImage
        var images:[UIImage] = []
        for i in 1 ... 5 {
            if let image = UIImage(named: "\(i)") {
                images.append(image)
            }
        }
        //创建可动画的图片
        let animateImages = UIImage.animatedImage(with: images, duration: 2.0)
        imageViewTwo.image = animateImages
        //2.2创建可变大小可动画的图片
//        let animateStretchImage = UIImage.animatedResizableImageNamed("image", capInsets: UIEdgeInsetsMake(5, 5, 5, 5), duration: 1.0)
//        let animateResizableImage = UIImage.animatedResizableImageNamed("image", capInsets: .zero, resizingMode: .stretch, duration: 1.0)
        //2.3 创建可变大小的图片.
        //创建可变大小图片的模式:1.tile平铺模式 2.stretch拉伸模式.默认为平铺模式
        //图片的可拉伸的区域:系统通过UIEdgeInsets将图片分成9个区域,其中四个边角的地方为不可拉伸的地方,其他的5个区域是被拉伸的地方
        let tileImage = imageOne?.resizableImage(withCapInsets: UIEdgeInsetsMake(10, 10, 10, 10))
        imageViewThree.image = tileImage
        let stretchImage = imageOne?.resizableImage(withCapInsets: UIEdgeInsetsMake(10, 10, 10, 10), resizingMode: .stretch)
        imageViewFour.image = stretchImage
        //2.4翻转图片,当有的地方的系统是从右往左显示内容的话,可以翻转图片来做国际化
        if let image = imageOne, image.flipsForRightToLeftLayoutDirection {
            let filpedImage = image.imageFlippedForRightToLeftLayoutDirection()
            imageViewFive.image = filpedImage
        }else {
            imageViewFive.image = imageTwo
        }
        //2.5 水平翻转图片
        let horizontallyFlippedImage = imageTwo?.withHorizontallyFlippedOrientation()
        imageViewSix.image = horizontallyFlippedImage
        //2.6 alignment insets
        let rectInsetsImage = imageOne?.withAlignmentRectInsets(UIEdgeInsetsMake(10, 10, 10, 10))
        imageViewSeven.image = rectInsetsImage
        imageViewEight.image = imageOne
        print("rectInsetsImageSize:\(rectInsetsImage!.size)")
        //2.7 图片的渲染,会通过tintColor来渲染图片
        //1.automic:系统自动处理
        //2.alwaysOriginal:使用原始图片不进行渲染
        //3.alwaysTemplate:作为样板进行渲染,忽略color
        leftBarButtonItem.tintColor = UIColor.orange
        let renderedImage = imageOne?.withRenderingMode(.alwaysOriginal)
        rightBarButtonItem.image = renderedImage
//        imageViewNine.tintColor = .blue
//        imageViewNine.image = renderedImage
        

        //3. 获取图片的相关信息
//        if let image = imageTwo {
//            let size = image.size //图片大小
//            let scale = image.scale //图片的比例
//            let cgImage = image.cgImage //获取cgImage
//            let ciImage = image.ciImage //获取ciImage
//            let images = image.images //当图片为animateImages,可能会有多张图片
//            let imageAsset = image.imageAsset //当image是从imageAssets中加载的,可以获取到图片的imageAsset
//            let orientation = image.imageOrientation //图片的方向
//            let flipsForRightToLeftLayoutDirection = image.flipsForRightToLeftLayoutDirection //是否需要旋转来适应内容的排序方向
//            let resizingMode = image.resizingMode //改变大小的模式
//            let duration = image.duration //animation 的duration的值
//            let capInset = image.capInsets //cap inset
//            let alignmentRectInset = image.alignmentRectInsets;
//            let traitCollection = image.traitCollection //image 当前所在环境
//            let renderMode = image.renderingMode //渲染模式
//            let renderFormat = image.imageRendererFormat //渲染格式
//        }
        //4.图片的绘制
        
    }
}

