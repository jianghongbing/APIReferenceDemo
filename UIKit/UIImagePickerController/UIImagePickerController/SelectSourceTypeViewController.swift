//
//  SelectSourceTypeViewController.swift
//  UIImagePickerController
//
//  Created by pantosoft on 2018/4/18.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit
import AVFoundation
import Photos


enum AccessLevel: String {
    case notDetermined = "用户还没有决定是否让你访问相机"
    case restricted = "相机访问受限制"
    case denied = "用户拒绝访问相机"
    case authorized = "用户同意访问相机"
}


enum PrivacyAccessItem {
    case photoLibrary
    case camera
    case mircophone
}

enum PrivacyItemAccessLevel {
    case notdetermined
    case restricted
    case denied(String, String)
    case authorized
}


enum PrivacyAccessDeined {
    case photoLibrary(String, String)
    case camera(String, String)
    case mircophone(String, String)
}

enum CaptrueMediaType: String {
    case image = "public.image"
    case video = "public.movie"
}






class SelectSourceTypeViewController: UIViewController {
    @IBOutlet fileprivate weak var imageView: UIImageView!
    @IBOutlet fileprivate weak var bottomLayoutConstraint: NSLayoutConstraint!
    private var originBottomLayoutConstraintConstant: CGFloat = 0
    @IBOutlet fileprivate weak var photoLibraryButton: UIButton!
    @IBOutlet fileprivate weak var cameraButton: UIButton!
    @IBOutlet fileprivate weak var savePhotoLibraryButton: UIButton!
    @IBOutlet weak var captureImageButton: UIButton!
    @IBOutlet weak var captureVideoButton: UIButton!
    private lazy var imagePickerController = UIImagePickerController()
    @IBOutlet var takePictureOverlayView: UIView!
    private var capturedImage: UIImage?
    private var videoURL: URL?
    override func viewDidLoad() {
        super.viewDidLoad()
        originBottomLayoutConstraintConstant = bottomLayoutConstraint.constant
        //UIImagePickerController:用于选取图片
        //sourceType:选取图片的来源,photoLibrary:图库(包括相册),camera:相机, savePhotosAlbum:相册,当相册不可用时会为相机
        photoLibraryButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        savePhotoLibraryButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum)
        //设置imagePickerController代理
        imagePickerController.delegate = self
    }
    @IBAction private func selectedPhotoLibrary(_ sender: UIButton) {
        setBottomLayoutConstraintConstant(originBottomLayoutConstraintConstant)
        
        presentImagePickerController(with: .photoLibrary)
    }

    @IBAction private func selectedCamera(_ sender: UIButton) {
        setBottomLayoutConstraintConstant(0)
    }
    @IBAction private func selectedSavePhotosAlbum(_ sender: UIButton) {
        setBottomLayoutConstraintConstant(originBottomLayoutConstraintConstant)
        presentImagePickerController(with: .savedPhotosAlbum)
    }
    
    private func setBottomLayoutConstraintConstant(_ constant: CGFloat) {
        guard constant != bottomLayoutConstraint.constant else {
            return
        }
        bottomLayoutConstraint.constant = constant
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction private func selectedCaptureImage(_ sender: UIButton) {
        requestAccessCamera { accessLevel in
            switch accessLevel {
            case .authorized:
                self.presentImagePickerController(with: .camera)
            case .denied(let title, let message):
                self.alert(with: title, message: message)
            default:
                break
            }
        }
    }
    
    
    @IBAction private func selectedCaptureVideo(_ sender: UIButton) {
        requestAccessMicrophone { accessLevel in
            switch accessLevel {
            case .authorized:
                self.requestAccessCamera(compelteHalder: { accessLevel in
                    switch accessLevel {
                    case .authorized:
                        self.presentImagePickerController(with: .camera, mediaType: .video)
                    case .denied(let title, let message):
                        self.alert(with: title, message: message)
                    default:
                        break
                    }
                })
            case .denied(let title, let message):
                self.alert(with: title, message: message)
            default:
                break
            }
        }
    }
    
    
    @IBAction func dismissImagePicker(_ sender: Any) {
        imagePickerController.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func takePicture(_ sender: Any) {
        imagePickerController.takePicture()
    }
    
    @IBAction func changeFlashMode(_ sender: Any) {
        //设置imagePicker的闪光灯模式
        if imagePickerController.cameraFlashMode == .auto {
            imagePickerController.cameraFlashMode = .off
        }else if imagePickerController.cameraFlashMode == .on {
            imagePickerController.cameraFlashMode = .auto
        }else if imagePickerController.cameraFlashMode == .off {
            imagePickerController.cameraFlashMode = .on
        }
    }
    
    @IBAction func delayTakePicture(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.imagePickerController.takePicture()
        }
    }
    
    
    
    @IBAction func saveImage(_ sender: Any) {
        requestAccessPhotoLibrary { accessLevel in
            switch accessLevel {
            case .authorized:
                self.writeImageToPhotosAlbum()
            case .denied(let title, let message):
                self.alert(with: title, message: message)
            default :
                break
            }
        }
    }
    
    @IBAction func saveVideo(_ sender: Any) {
        requestAccessPhotoLibrary { accessLevel in
            switch accessLevel {
            case .authorized:
                self.writeVideoToPhotosAlbum()
            case .denied(let title, let message):
                self.alert(with: title, message: message)
            default :
                break
            }
        }
        
        
    }
    private func writeImageToPhotosAlbum() {
        if let image = self.capturedImage, imagePickerController.sourceType == .camera {
            UIImageWriteToSavedPhotosAlbum(image, self, #selector(writeImageHandler(_:didFinishSaving:contextInfo:)), nil)
        }else {
            alert(with: "请先拍摄一张照片", message: "图库或者相册里面选的不能保存哦")
        }
    }
    
    private func writeVideoToPhotosAlbum() {
        if let videoURL = self.videoURL, imagePickerController.sourceType == .camera {
            UISaveVideoAtPathToSavedPhotosAlbum(videoURL.path, self, #selector(writeVideoHandler(_:didFinishSaving:contextInfo:)), nil)
        }else {
            alert(with: "没有视频哦", message: "请先拍摄一段视频在保存")
        }
    }
    
    
    
    @objc private func writeImageHandler(_ image: UIImage, didFinishSaving error: NSError?, contextInfo: Any?) {
        if let error = error {
            print("write image fail error: \(error)")
        }else {
            print("writeImageSuccessful");
        }
    }
    
    @objc private func writeVideoHandler(_ videoPath: String, didFinishSaving error: NSError?, contextInfo: Any?) {
        if let error = error {
            print("write video fail error: \(error)")
        }else {
            print("writeImageSuccessful path:\(videoPath)");
        }
    }
    
    
    
    
    
    private func presentImagePickerController(with sourceType: UIImagePickerControllerSourceType, mediaType: CaptrueMediaType = .image) {
        //设置imagePickerController的sourceType
        imagePickerController.sourceType = sourceType
        if sourceType == .camera {
            //判断前后摄像头是否可用
            if UIImagePickerController.isCameraDeviceAvailable(.rear) {
                imagePickerController.cameraDevice = .rear //设置为后摄像头
            }else if UIImagePickerController.isCameraDeviceAvailable(.front) {
                imagePickerController.cameraDevice = .front //设置为前摄像头
            }
            if mediaType == .video {
                //判断当前sourceType可用的mediaType
                if let availableMediaTypes = UIImagePickerController.availableMediaTypes(for: .camera), availableMediaTypes.contains(mediaType.rawValue){
                    //设置medieTypes:常用的有public.image图片,public.movie:摄影
                    imagePickerController.mediaTypes = [CaptrueMediaType.video.rawValue, CaptrueMediaType.image.rawValue]
                    //设置摄影的最长时间
                    imagePickerController.videoMaximumDuration = 30
                    //设置录制视频的质量
                    imagePickerController.videoQuality = .typeHigh
                    
                    imagePickerController.showsCameraControls = true
                    imagePickerController.cameraOverlayView = nil;
                    
                }
            }else {
                //设置相机画面的transform
//                imagePickerController.cameraViewTransform = CGAffineTransform(rotationAngle: CGFloat.pi * 0.25)
                //是否显示cameraContros
                imagePickerController.showsCameraControls = false
                //自定义cameraOvelayView
                takePictureOverlayView.frame = (imagePickerController.cameraOverlayView?.frame)!
                imagePickerController.cameraOverlayView = takePictureOverlayView
                
            }
        }else {
            //对选中或拍照好的图片,是否可编辑
            imagePickerController.allowsEditing = true

        }
        present(imagePickerController, animated: true, completion: nil)
    }
    
    
 
    
    private func requestAccess(for accessItem: PrivacyAccessItem,  completeHandler: @escaping (PrivacyItemAccessLevel) -> Void) {
        switch accessItem {
        case .photoLibrary:
            requestAccessPhotoLibrary(compelteHalder: completeHandler)
        default:
            break;
        }
    }
    
    private func requestAccessPhotoLibrary(compelteHalder: @escaping (PrivacyItemAccessLevel) -> Void) {
        let authorizationStatus = PHPhotoLibrary.authorizationStatus()
        switch authorizationStatus {
        case .notDetermined:
            fallthrough
        case .restricted:
            PHPhotoLibrary.requestAuthorization { (authorizationStatus) in
                DispatchQueue.main.async {
                    self.requestAccessPhotoLibrary(compelteHalder: compelteHalder)
                }
            }
        case .denied:
            compelteHalder(PrivacyItemAccessLevel.denied("相册访问被拒绝", "请到设置-app-照片里面修改权限"))
        case .authorized:
            compelteHalder(.authorized)
        }
    }
    
    private func requestAccessCamera(compelteHalder: @escaping (PrivacyItemAccessLevel) -> Void) {
        requestAccessCaptureDevice(mediaType: .video, compelteHalder: compelteHalder)
    }
    
    private func requestAccessMicrophone(compelteHalder: @escaping (PrivacyItemAccessLevel) -> Void) {
        requestAccessCaptureDevice(mediaType: .audio, compelteHalder: compelteHalder)
    }
    
    
    private func requestAccessCaptureDevice(mediaType: AVMediaType, compelteHalder: @escaping (PrivacyItemAccessLevel) -> Void) {
        let authorizationStatus = AVCaptureDevice.authorizationStatus(for: mediaType)
        switch authorizationStatus {
        case .notDetermined:
            fallthrough
        case .restricted:
            AVCaptureDevice.requestAccess(for: mediaType) { _ in
                DispatchQueue.main.async {
                    self.requestAccessCaptureDevice(mediaType: mediaType, compelteHalder: compelteHalder)
                }
            }
        case .denied:
            let title = mediaType == .video ? "相机访问被拒绝" : "麦克风访问被拒绝"
            let message = mediaType == .video ? "请到设置-找到UIImgePickerController应用-修改相机访问权限" : "请到设置-找到UIImgePickerController应用-修改麦克风访问权限"
            compelteHalder(PrivacyItemAccessLevel.denied(title, message))
        case .authorized:
            compelteHalder(.authorized)
        }
        
    }
    
}

extension SelectSourceTypeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("imagePicker cancel")
        imagePickerController.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("info:\(info)")
        
        if let videoURL = info["UIImagePickerControllerMediaURL"] as? URL { //获取拍摄视频后的地址
            self.videoURL = videoURL
        }else {
            if let image = info["UIImagePickerControllerEditedImage"] as? UIImage { //获取编辑后的图片
            self.imageView.image = image
            if picker.sourceType == .camera {
                self.capturedImage = image
            }
        }else if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage { //获取原始图片
            self.imageView.image = image
            if picker.sourceType == .camera {
                self.capturedImage = image
            }
        }
        }
        picker.dismiss(animated: true, completion: nil)
    }
}


