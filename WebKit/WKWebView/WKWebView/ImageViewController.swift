//
//  ImageViewController.swift
//  WKWebView
//
//  Created by pantosoft on 2018/12/11.
//  Copyright © 2018 jianghongbing. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    private var image: UIImage
    init(_ image: UIImage) {
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(image: self.image)
        view.addSubview(imageView)
    }

}
